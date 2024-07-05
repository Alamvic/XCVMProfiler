Class {
	#name : 'PerfTreeParser',
	#superclass : 'Object',
	#instVars : [
		'content',
		'totalTime'
	],
	#category : 'PerfTreeParser',
	#package : 'PerfTreeParser'
}

{ #category : 'instance creation' }
PerfTreeParser class >> findTraces: aFile [

	^ (self parseFile: aFile) collect: [:tree | tree traces ]
]

{ #category : 'instance creation' }
PerfTreeParser class >> fromFile: aFile [

	^ self new
		  content: aFile asFileReference;
		  yourself
]

{ #category : 'instance creation' }
PerfTreeParser class >> parseFile: aFile [

	^ (self fromFile: aFile) roots
]

{ #category : 'accessing' }
PerfTreeParser >> content [

	^ content
]

{ #category : 'accessing' }
PerfTreeParser >> content: aFile [
	"Extract the interesting content from the file."

	| fileContents i |
	fileContents := aFile contents lines.
	i := 1.

	[ (fileContents at: i) beginsWith: '# sample duration' ] whileFalse: [
		i := i + 1 ].

	self time: ((((fileContents at: i) last: 14) first: 11) copyWithout: Character space) asNumber.

	content := fileContents reject: [ :line | line beginsWith: '#' ].
	content := content select: [ :line |
		           ((line copyWithout: Character space) copyWithout: $|)
			           isNotEmpty ]
]

{ #category : 'accessing' }
PerfTreeParser >> differenceOfSpacesAt: aNodeIndex [
	"Gives the difference of the number of spaces between 2 followed lines."

	^ (self numberOfSpacesAt: aNodeIndex + 1)
	  - (self numberOfSpacesAt: aNodeIndex)
]

{ #category : 'accessing' }
PerfTreeParser >> findParentIndexOfIndex: aNodeIndex [
	"Gives an ordered collection of every indexes of the lines where there is a child."

	| lastNodeIndex everyParent newBranch spaces nodeSpaces |
	lastNodeIndex := self numberOfFunctions.
	everyParent := OrderedCollection new.

	(aNodeIndex + 1 between: 1 and: self numberOfFunctions) ifFalse: [
		^ everyParent ].

	((self percentageOf: aNodeIndex)
	 = (self percentageOf: aNodeIndex + 1) and: [
		 ((self readLine: aNodeIndex + 1) findString: '[') = 0 ]) ifTrue: [
		everyParent add: aNodeIndex + 1.
		^ everyParent ].

	newBranch := false.
	nodeSpaces := self numberOfSpacesAt: aNodeIndex.
	aNodeIndex + 1 to: lastNodeIndex do: [ :i |
		spaces := self numberOfSpacesAt: i.
		spaces <= nodeSpaces ifTrue: [ newBranch := true ].
		((spaces - nodeSpaces between: 1 and: 11) and: [
			 (self percentageOf: i) ~= (self percentageOf: i - 1) and: [
				 newBranch not ] ]) ifTrue: [ everyParent add: i ] ].

	^ everyParent
]

{ #category : 'accessing' }
PerfTreeParser >> findParentOfIndex: aNodeIndex [
	"Gives the nodes representing every children at the node aNodeIndex."

	| collectionOfParentIndexes |
	collectionOfParentIndexes := self findParentIndexOfIndex: aNodeIndex.
	^ collectionOfParentIndexes collect: [ :childIndex |
		  self nodeAtIndex: childIndex ]
]

{ #category : 'accessing' }
PerfTreeParser >> lastSpaceAt: aLine [
	"Gives the index of the last space or '-' at a given line."

	| lastSpace line |
	line := self readLine: aLine.
	lastSpace := 0.

	2 to: line size do: [ :i |
		(((line at: i) = Character space and: [
			  (line at: i - 1) = Character space ]) or: [
			 (line at: i) = $- or: [
				 (line at: i) = Character space and: [ (line at: i - 1) = $] ] ] ])
			ifTrue: [ lastSpace := i ] ].
	^ lastSpace
]

{ #category : 'accessing' }
PerfTreeParser >> nameOf: aNodeIndex [
	"Gives the name of a function at aNodeIndex."

	| aLine |
	aLine := self readLine: aNodeIndex.
	^ aLine last: aLine size - (self lastSpaceAt: aNodeIndex)
]

{ #category : 'accessing' }
PerfTreeParser >> nodeAtIndex: aNodeIndex [
	"Gives the node representing the node at aNodeIndex."

	| node |
	node := PerfTreeNode new
		         name: (self nameOf: aNodeIndex);
		         time: (self timeOf: aNodeIndex);
		         totalTime: self time;
					timeWithParents: (self timeWithParentOf: aNodeIndex);
					rawPercentage: (self rawPercentageOf: aNodeIndex);
		         yourself.
	node parents: (self findParentOfIndex: aNodeIndex).
	node parents do: [ :parent | parent child: node ].
	^ node
]

{ #category : 'accessing' }
PerfTreeParser >> numberOfFunctions [
	"Gives the number of functions present in the file."

	^ content size
]

{ #category : 'accessing' }
PerfTreeParser >> numberOfSpacesAt: aNodeIndex [
	"Gives the number of spaces at a certain line."

	| count lineRead |

	lineRead := self readLine: aNodeIndex.
	count := 1.

	[(lineRead at: count) = Character space or: [
		(lineRead at: count) = $| ] ] whileTrue: [ count := count + 1 ].
	^ count - 1
]

{ #category : 'accessing' }
PerfTreeParser >> percentageOf: aLineIndex [
	"Gives the percentage from a function at a given line"

	"In the case of multiples functions for one percentage, it gives the same percentage to every functions."

	| stringLine numbers |
	stringLine := self rawPercentageOf: aLineIndex.

	stringLine ifEmpty: [ ^ 0 ].

	numbers := stringLine asNumber.

	^ numbers
]

{ #category : 'accessing' }
PerfTreeParser >> rawPercentageOf: aLine [
	"Gives the percentage from a function at a given line"

	"In the case of multiples functions for one percentage, it gives the same percentage to every functions."

	| stringLine |
	(aLine between: 1 and: self numberOfFunctions) ifFalse: [ ^ '' ].

	stringLine := ((((self readLine: aLine) copyUpTo: $%) last: 5)
		               copyWithout: $-) copyWithout: Character space.

	stringLine = ((self readLine: aLine) last: stringLine size) ifTrue: [
		^ self rawPercentageOf: aLine - 1 ].

	^ stringLine
]

{ #category : 'accessing' }
PerfTreeParser >> readLine: anIndex [
	"Reads a line from the file without the commentaries."
	^ self content at: anIndex
]

{ #category : 'accessing' }
PerfTreeParser >> realPercentageOf: aNodeIndex [

	| nodePercentage children childrenPercentage |
	nodePercentage := self percentageOf: aNodeIndex.
	children := self findParentIndexOfIndex: aNodeIndex.
	childrenPercentage := 0.
	children ifEmpty: [ ^ nodePercentage ].


	childrenPercentage := children sum: [ :child |
		                      self percentageOf: child ].

	^ nodePercentage - childrenPercentage round: 2
]

{ #category : 'accessing' }
PerfTreeParser >> roots [

	| roots |
	roots := OrderedCollection new.
	
	1 to: self numberOfFunctions do: [:i |
		(self numberOfSpacesAt: i) <= 5 ifTrue: [ roots add: (self nodeAtIndex: i) ] ].
	
	^ roots
]

{ #category : 'accessing' }
PerfTreeParser >> time [

	^ totalTime
]

{ #category : 'accessing' }
PerfTreeParser >> time: aFloat [

	totalTime := aFloat.
]

{ #category : 'accessing' }
PerfTreeParser >> timeOf: aNodeIndex [

	| newPercentage |
	newPercentage := self realPercentageOf: aNodeIndex.

	^ totalTime * (newPercentage/100) round: 2
]

{ #category : 'accessing' }
PerfTreeParser >> timeWithParentOf: aNodeIndex [

	| newPercentage |
	newPercentage := self percentageOf: aNodeIndex.

	^ totalTime * (newPercentage/100) round: 2
]

{ #category : 'accessing' }
PerfTreeParser >> withoutSpaces [
	"Gives a line without the characters that are not interesting."

	^ self content collect: [ :c |
		  (c copyWithout: Character space) copyWithout: $| ]
]

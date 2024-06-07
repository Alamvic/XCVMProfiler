Class {
	#name : #PerfTreeParser,
	#superclass : #Object,
	#instVars : [
		'content',
		'totalTime'
	],
	#category : #PerfTreeParser
}

{ #category : #'instance creation' }
PerfTreeParser class >> fromFile: aFile [

	^ self new
		  content: aFile asFileReference;
		  yourself
]

{ #category : #'instance creation' }
PerfTreeParser class >> parseFile: aFile [

	^ (self fromFile: aFile) root
]

{ #category : #accessing }
PerfTreeParser >> content [

	^ content
]

{ #category : #accessing }
PerfTreeParser >> content: aFile [
	"Extract the interesting content from the file."

	| fileContents i |
	fileContents := aFile contents lines.
	i := 1.

	[ (fileContents at: i) beginsWith: '# sample duration' ] whileFalse: [
		i := i + 1 ].

	self time: (((fileContents at: i) last: 10) first: 7) asNumber.

	content := fileContents reject: [ :line | line beginsWith: '#' ].
	content := content select: [ :line |
		           ((line copyWithout: Character space) copyWithout: $|)
			           isNotEmpty ]
]

{ #category : #accessing }
PerfTreeParser >> differenceOfSpacesAt: aNodeIndex [
	"Gives the difference of the number of spaces between 2 followed lines."

	^ (aNodeIndex between: 1 and: self numberOfFunctions)
		  ifFalse: [ nil ]
		  ifTrue: [
			  (self numberOfSpacesAt: aNodeIndex + 1)
			  - (self numberOfSpacesAt: aNodeIndex) ]
]

{ #category : #accessing }
PerfTreeParser >> findChildrenIndexOfIndex: aNode [
	"Gives an ordered collection of every indexes of the lines where there is a child."

	| lastNode everyChildren |
	lastNode := self numberOfFunctions.
	everyChildren := OrderedCollection new.

	(aNode between: 1 and: lastNode) ifFalse: [ ^ 0 ].

	(((self differenceOfSpacesAt: aNode) between: 1 and: 10) or: [
		 (self percentageOf: aNode) = (self percentageOf: aNode + 1) ])
		ifTrue: [
			everyChildren add: aNode + 1.
			^ everyChildren ].

	aNode to: lastNode do: [ :i |
		(self numberOfSpacesAt: i) - (self numberOfSpacesAt: aNode) = 11
			ifTrue: [ everyChildren add: i ] ].

	^ everyChildren
]

{ #category : #accessing }
PerfTreeParser >> findChildrenOfIndex: aNodeIndex [
	"Gives the nodes representing every children at the node aNodeIndex."

	| collectionOfChildrenIndexes |
	collectionOfChildrenIndexes := self findChildrenIndexOfIndex: aNodeIndex.
	^ collectionOfChildrenIndexes collect: [ :childIndex |
		  self nodeAtIndex: childIndex ]
]

{ #category : #accessing }
PerfTreeParser >> lastSpaceAt: aLine [
	"Gives the index of the last space or '-' at a given line."

	| lastSpace line |
	(aLine between: 1 and: self numberOfFunctions) ifFalse: [ ^ nil ].

	line := self readLine: aLine.
	lastSpace := 0.

	1 to: line size do: [ :i |
		((line at: i) = Character space or: [ (line at: i) = $- ]) ifTrue: [
			lastSpace := i ] ].
	^ lastSpace
]

{ #category : #accessing }
PerfTreeParser >> nameOf: aNodeIndex [
	"Gives the name of a function at aNodeIndex."

	| aLine |
	(aNodeIndex between: 1 and: self numberOfFunctions) ifFalse: [ ^ nil ].

	aLine := self readLine: aNodeIndex.
	^ aLine last: aLine size - (self lastSpaceAt: aNodeIndex)
]

{ #category : #accessing }
PerfTreeParser >> nodeAtIndex: aNodeIndex [
	"Gives the node representing the node at aNodeIndex."

	| child |
	(aNodeIndex between: 1 and: self numberOfFunctions) ifFalse: [ ^ nil ].

	child := PerfTreeNode new
		         name: (self nameOf: aNodeIndex);
		         weight: (self weightOf: aNodeIndex);
		         time: self time;
		         yourself.
	child children: (self findChildrenOfIndex: aNodeIndex).
	child children do: [ :grandchild | grandchild parent: child ].
	^ child
]

{ #category : #accessing }
PerfTreeParser >> numberOfFunctions [
	"Gives the number of functions present in the file."

	^ content size
]

{ #category : #accessing }
PerfTreeParser >> numberOfSpacesAt: aNodeIndex [
	"Gives the number of spaces at a certain line."

	| count lineRead |
	count := 0.

	(aNodeIndex between: 1 and: self numberOfFunctions) ifFalse: [
		^ count ].

	lineRead := self readLine: aNodeIndex.
	count := 1.

	[(lineRead at: count) = Character space or: [
		(lineRead at: count) = $| ] ] whileTrue: [ count := count + 1 ].
	^ count - 1
]

{ #category : #accessing }
PerfTreeParser >> percentageOf: aLine [
	"Gives the percentage from a function at a given line"

	"In the case of multiples functions for one percentage, it gives the same percentage to every functions."

	| stringLine numbers |
	(aLine between: 1 and: self numberOfFunctions) ifFalse: [ ^ 0 ].

	stringLine := ((self content at: aLine) copyUpTo: $%) last: 5.

	stringLine = ((self content at: aLine) last: 5) ifTrue: [
		^ self percentageOf: aLine - 1 ].

	numbers := stringLine asNumber.
	numbers < 0 ifTrue: [ numbers := numbers negated ].

	^ numbers
]

{ #category : #accessing }
PerfTreeParser >> readLine: anIndex [
	"Reads a line from the file without the commentaries."

	(anIndex between: 1 and: self numberOfFunctions)
		ifTrue: [ ^ self content at: anIndex ]
		ifFalse: [ ^ nil ]
]

{ #category : #accessing }
PerfTreeParser >> realPercentageOf: aNodeIndex [

	| children childrenPercentage |
	children := self findChildrenIndexOfIndex: aNodeIndex.
	childrenPercentage := 0.
	children isCollection ifFalse: [ ^ self percentageOf: aNodeIndex ].


	1 to: children size do: [ :childIndex |
		childrenPercentage := childrenPercentage
		                      +
		                      (self percentageOf: (children at: childIndex)) ].

	^ (self percentageOf: aNodeIndex) - childrenPercentage roundUpTo:
		  0.01
]

{ #category : #accessing }
PerfTreeParser >> root [
	"Gives the first parent of the nodes"

	^ self nodeAtIndex: 1
]

{ #category : #accessing }
PerfTreeParser >> time [

	^ totalTime
]

{ #category : #accessing }
PerfTreeParser >> time: aFloat [

	totalTime := aFloat.
]

{ #category : #accessing }
PerfTreeParser >> weightOf: aNodeIndex [

	| newPercentage |
	newPercentage := self realPercentageOf: aNodeIndex.

	^ totalTime * (newPercentage/100) roundUpTo: 0.01
]

{ #category : #accessing }
PerfTreeParser >> withoutSpaces [
	"Gives a line without the characters that are not interesting."

	^ self content collect: [ :c |
		  (c copyWithout: Character space) copyWithout: $| ]
]

Class {
	#name : #TreeNodes,
	#superclass : #Object,
	#instVars : [
		'time',
		'nodeStrings'
	],
	#category : #TreeParser
}

{ #category : #'instance creation' }
TreeNodes class >> fromContent: aTreeParse [

	^ self new
		nodes: aTreeParse content;
		time: aTreeParse time.
]

{ #category : #accessing }
TreeNodes >> classify [
	"Establish every parent/child links given by the file."

	^ (self classify: 1 withParent: nil)
]

{ #category : #accessing }
TreeNodes >> classify: aLine withParent: aParent [
	"Establish the parent/child links, starting from a given line and optionally a parent."

	| child |
	child := TreeChildren new
		         name: (self nameOf: aLine);
		         percentage: (self percentageOf: aLine);
					time: self time;
		         parent: aParent.
	child children: ((self findChildrenIndexOfIndex: aLine) collect: [ :c |
			 self classify: c withParent: child ]).
	child estimatePercentage.
	child weight.
	^ child
]

{ #category : #accessing }
TreeNodes >> differenceOfSpacesAt: aNode [
	"Gives the difference of the number of spaces between 2 followed lines."

	self assert: aNode > 0.
	self assert: aNode < self numberOfFunctions.
	^ (self numberOfSpacesAt: aNode + 1) - (self numberOfSpacesAt: aNode)
]

{ #category : #accessing }
TreeNodes >> findChildrenIndexOfIndex: aNode [
	"Gives an ordered collection of every indexes of the lines where there is a child."

	| lastNode everyChildren |
	lastNode := self numberOfFunctions.
	everyChildren := OrderedCollection new.

	aNode = lastNode ifTrue: [ ^ everyChildren ].
	( aNode < 1 or: aNode > lastNode ) ifTrue: [ ^ nil ].

	((self differenceOfSpacesAt: aNode) <= 10 and: (self differenceOfSpacesAt: aNode) >= 0) 
		ifTrue: [	everyChildren add: aNode + 1.
		^ everyChildren ].

	aNode to: lastNode do: [ :i |
		(self numberOfSpacesAt: i) - (self numberOfSpacesAt: aNode) = 11
			ifTrue: [ everyChildren add: i ] ].

	^ everyChildren
]

{ #category : #accessing }
TreeNodes >> findParentIndexOfIndex: aNodeIndex [
	"Gives the index of the line where the parent is."

	| i |

	i := aNodeIndex-1.
	[ (i > 1 and: i <= self numberOfFunctions) and: [ ( (self numberOfSpacesAt: aNodeIndex) - (self numberOfSpacesAt: i) ) <= 0 ] ]
		whileTrue: [ i := i - 1 ].

	((i > 0) and: i <= self numberOfFunctions)
		ifTrue: [	 ^ i ]
		ifFalse: [ ^ nil ]
]

{ #category : #accessing }
TreeNodes >> findParentOfIndex: aNodeIndex [
	"Gives the node representing the parent of the node at aNodeIndex."

	| parentIndex |
	parentIndex := self findParentIndexOfIndex: aNodeIndex.
	^ self nodeAtIndex: parentIndex
]

{ #category : #accessing }
TreeNodes >> lastSpaceAt: aLine [
	"Gives the index of the last space at a given line."
	
	| lastSpace line|
	self assert: aLine >= 1.
	self assert: aLine <= self numberOfFunctions.
	
	line := nodeStrings at: aLine.
	lastSpace := line size.
	
	1 to: (line size) do: [:i | ( ( (line at: i) = Character space) or: ( (line at: i) = $-) )
		ifTrue: [ lastSpace := line size - i ] ].
	^ lastSpace
]

{ #category : #accessing }
TreeNodes >> nameOf: aLine [
	"Gets the name of a function at a given line."

	| line |
	self assert: aLine >= 1.
	self assert: aLine <= self numberOfFunctions.
	
	line := (self withoutSpaces at: aLine) copyWithout: $-.
	^ line last: (self lastSpaceAt: aLine)
]

{ #category : #accessing }
TreeNodes >> nodeAtIndex: aNodeIndex [
	"Gives the node representing the node at aNodeIndex."

	aNodeIndex ifNil: [ ^ nil ].
	^ TreeNode new
		  parser: self;
		  index: aNodeIndex;
		  name: (self nameOf: aNodeIndex);
		  weight: 0;
		  yourself
]

{ #category : #accessing }
TreeNodes >> nodes [

	^ nodeStrings
]

{ #category : #accessing }
TreeNodes >> nodes: aContent [

	"Ignore all lines that are empty or have useless information"
	nodeStrings := aContent select: [ :line |
		         ((line copyWithout: Character space) copyWithout: $|)
			         isNotEmpty ]
]

{ #category : #accessing }
TreeNodes >> numberOfFunctions [
	"Gives the number of non-unique functions mentioned in the file."

	^ nodeStrings size
]

{ #category : #accessing }
TreeNodes >> numberOfSpacesAt: aNode [
	"Gives the number of spaces at a certain line."

	| count spacesAreEnded |
	count := 0.
	spacesAreEnded := false.
	(self nodes at: aNode) do: [ :c |
		(c ~= Character space and: c ~= $|)
			ifFalse: [ spacesAreEnded ifFalse: [ count := count + 1 ] ]
			ifTrue: [ spacesAreEnded := true ] ].
	^ count
]

{ #category : #accessing }
TreeNodes >> percentageOf: aLine [
	"Gives the percentage from a function at a given line"

	"In the case of multiples functions for one percentage, it gives the same percentage to every functions."

	| line numbers |
	self assert: aLine > 0.
	self assert: aLine <= self numberOfFunctions.
	line := self nodes at: aLine.

	numbers := (((self withoutSpaces at: aLine) copyWithout: $-) first: 5)
		           select: [ :c |
		           { $0. $1. $2. $3. $4. $5. $6. $7. $8. $9 } asSet
			           includes: c ].
	(aLine > 1 and: numbers isEmpty) ifTrue: [
		^ self percentageOf: aLine - 1 ].
	numbers size >= 4
		ifTrue: [ ^ ((numbers first: 4) asInteger / 100) asFloat ]
		ifFalse: [ ^ ((numbers first: 3) asInteger / 100) asFloat ]
]

{ #category : #accessing }
TreeNodes >> time [

	^ time
]

{ #category : #accessing }
TreeNodes >> time: aFloat [

	time := aFloat.
]

{ #category : #accessing }
TreeNodes >> withoutSpaces [
	"Gives a line without the characters that are not interesting."

	^ self nodes collect: [ :n |
		  (n copyWithout: Character space) copyWithout: $| ]
]

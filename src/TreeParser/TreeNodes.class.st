Class {
	#name : #TreeNodes,
	#superclass : #Object,
	#instVars : [
		'nodes'
	],
	#category : #TreeParser
}

{ #category : #accessing }
TreeNodes >> classify [
	"Recreates the parent/child links given by the file."

	| length list |
	length := self numberOfFunctions.
	list := Array new: length.

	1 to: length do: [:i | 
		list at: i put: (self classify: i) ].
	
	^ list
]

{ #category : #accessing }
TreeNodes >> classify: aLine [

	| length child |
	length := self numberOfFunctions.
	child := TreeChildren new
				 children: (self findChildrenOf: aLine);
				 parent: (self findParentOf: aLine);
				 name: (self nameOf: aLine);
				 percentage: (self percentageOf: aLine).
	^ child
]

{ #category : #accessing }
TreeNodes >> differenceOfSpacesAt: aNode [
	"Gives the difference of the number of spaces between 2 followed lines."

	self assert: aNode < self numberOfFunctions.
	^ (self numberOfSpacesAt: aNode + 1) - (self numberOfSpacesAt: aNode)
]

{ #category : #accessing }
TreeNodes >> findChildrenOf: aNode [

	| lastNode everyChildren |
	lastNode := self numberOfFunctions.
	everyChildren := OrderedCollection new.

	aNode = lastNode ifTrue: [ ^ everyChildren ].

	((self differenceOfSpacesAt: aNode) <= 10 and: (self differenceOfSpacesAt: aNode) >= 0) 
		ifTrue: [	everyChildren add: (self nameOf: aNode + 1).
		^ everyChildren ].

	aNode + 1 to: lastNode - 1 do: [ :i |
		(self numberOfSpacesAt: i) - (self numberOfSpacesAt: aNode) = 11
			ifTrue: [ everyChildren add: (self nameOf: i) ] ].

	^ everyChildren
]

{ #category : #accessing }
TreeNodes >> findParentOf: aNode [

	| i |
	i := aNode-1.
	[ i > 1 and: [ ( (self numberOfSpacesAt: aNode) - (self numberOfSpacesAt: i) ) < 0 ] ]
		whileTrue: [ i := i - 1 ].

	(i > 0)
		ifTrue: [	 ^ self nameOf: i ]
		ifFalse: [ ^ nil ]
]

{ #category : #accessing }
TreeNodes >> lastNodeOf: aNode [
	"Give the index of the last node starting from a given node."

	| lastNode |
	lastNode := self numberOfFunctions.
	aNode to: lastNode - 1 do: [ :i |
	(self differenceOfSpacesAt: i) < 0 ifTrue: [ ^ i ] ].
	^ aNode
]

{ #category : #accessing }
TreeNodes >> nameOf: aLine [
	"Gets the name of a function at a given line."

	| line |
	line := (self withoutSpaces at: aLine) copyWithout: $-.
	(aLine > 1 and: [
		 (self percentageOf: aLine - 1) = (self percentageOf: aLine) ])
		ifTrue: [ ^ line ]
		ifFalse: [
			^ line last:
				  line size - (self percentageOf: aLine) asString size - 1 ]
]

{ #category : #accessing }
TreeNodes >> nodes [

	^ nodes
]

{ #category : #accessing }
TreeNodes >> nodes: aContent [

	nodes := aContent select: [ :c |
		         ((c copyWithout: Character space) copyWithout: $|)
			         isNotEmpty ]
]

{ #category : #accessing }
TreeNodes >> numberOfFunctions [
	"Gives the number of non-unique functions mentioned in the file."

	^ nodes size
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

	"In the case of multiples functions for one percentage, it gives the same percentage so it's precise yet."

	| line numbers |
	self assert: aLine >= 1.
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
TreeNodes >> withoutSpaces [
	"Gives a line without the characters that are not interesting."

	^ self nodes collect: [ :n |
		  (n copyWithout: Character space) copyWithout: $| ]
]

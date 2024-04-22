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
	"Recreates the parent/child links given by the file. DOES NOT WORK PROPERLY YET"
	|list|
	list := Array new: (self numberOfFunctions).
	
	1 to: (self numberOfFunctions) do: [:i |
		 list at: i put:
			(TreeChildren new
				children: (self findChildrenOf: i);
				parent: (self findParentOf: i);
				name: (self nameOf: i);
				percentage: (self percentageOf: i) )].
	"""
	1 to: (self numberOfFunctions) do: [:i |
		(i>1)
			ifTrue: [ ((self differenceOfSpacesAt: i-1) = 0)
				ifTrue: [(list at: i) parent: ((list at: i-1) parent)]  
			
				ifFalse: [ ( (self differenceOfSpacesAt: i-1) < 0 )
					ifTrue: [ self findParentFrom: i ]
					ifFalse: [ (list at: i) parent: (list at: i-1) ] ] ]
			ifFalse: [ nil ].
		(i< (self numberOfFunctions) )
			ifTrue: [
				((self differenceOfSpacesAt: i) = 0)
				ifTrue: [ (list at: i) children: ((list at: i+1) children) ]
				
				ifFalse: [ ((self differenceOfSpacesAt: i) < 0)
					ifTrue: [ (list at: i) children: nil ]
					ifFalse: [ (list at: i) children: (list at: i+1) ] ] ] 
			ifFalse: [ nil ] ]."""
	^ list
]

{ #category : #accessing }
TreeNodes >> classify: aLine [
	|child|
	child := TreeChildren new
		children: (TreeChildren new parent: child ; 
			name: ((aLine< (self numberOfFunctions) )
				ifTrue: [self nameOf: (aLine+1)] 
				ifFalse: [ nil ]) ;
			percentage: ((aLine< (self numberOfFunctions) )
				ifTrue: [self percentageOf: (aLine+1)] 
				ifFalse: [ nil ]) ) ;
		
		parent: (TreeChildren new 
			children: child ;
			name: ((aLine>0)
				ifTrue: [self nameOf: (aLine+1)] 
				ifFalse: [ nil ]) ;
			percentage: ((aLine>0)
				ifTrue: [self percentageOf: (aLine+1)] 
				ifFalse: [ nil ]) ) ;
			
		name: (self nameOf: aLine) ;
		percentage: (self percentageOf: aLine).
	^ child
]

{ #category : #accessing }
TreeNodes >> differenceOfSpacesAt: aNode [
	"Gives the difference of the number of spaces between 2 followed lines."
	self assert: aNode < (self numberOfFunctions).
	^ ((self numberOfSpacesAt: aNode+1) - (self numberOfSpacesAt: aNode))
]

{ #category : #accessing }
TreeNodes >> findChildrenOf: aNode [
	|list|
	list := self nodes.
	(aNode < self numberOfFunctions)
	ifTrue: [ ((self differenceOfSpacesAt: aNode) = 0)
				ifTrue: [^ self findChildrenOf: aNode+1]
			
				ifFalse: [ ( (self differenceOfSpacesAt: aNode) < 0 )
					ifTrue: [ ^ nil ]
				
					ifFalse: [ |spaces everyChildren|
						everyChildren := OrderedCollection new.
						spaces := self numberOfSpacesAt: aNode+1.
						aNode to: (self numberOfFunctions - 1) do: [:j | ( (self differenceOfSpacesAt: j) >= 0 and: ( spaces = (self numberOfSpacesAt: j) ) )
							ifTrue: [ everyChildren add: (list at: j) ] ].
						^ everyChildren ] ] ]
	ifFalse: [ ^ nil ].
]

{ #category : #'as yet unclassified' }
TreeNodes >> findParentFrom: aNode [
	|i|
	i := aNode.
	[ (i>=1) and: [ (self numberOfSpacesAt: aNode) - (self numberOfSpacesAt: i) < 10 ] ] whileTrue:
		[ i:=i-1 ].
	^ (self nodes at: i)
]

{ #category : #accessing }
TreeNodes >> findParentOf: aNode [
	|list|
	list := self nodes.
	(aNode > 1)
	ifTrue: [ ((self differenceOfSpacesAt: aNode-1) = 0)
				ifTrue: [^ (self findParentOf: aNode-1)]
			
				ifFalse: [ ( (self differenceOfSpacesAt: aNode-1) < 0 )
					ifTrue: [ aNode to: 1 by: -1 do: [:i |
							(self numberOfSpacesAt: i) < (self numberOfSpacesAt: aNode)
								ifTrue: [ (self percentageOf: i) = (self percentageOf: aNode)
									ifFalse: [ ^ (list at: i) ] ] ] ]
				
					ifFalse: [ ^(list at: aNode-1) ] ] ]
	ifFalse: [ ^ nil ].
]

{ #category : #accessing }
TreeNodes >> lastNodeOf: aPlace [
	|c|
	c := 1.
	1 to: aPlace do: [:n | 
		[ ( self differenceOfSpacesAt: c ) >= 0 ] whileTrue: [ 
			 c:=c+1].
		n=aPlace ifTrue:[ ^ self nodes at: c ].
		( ( self differenceOfSpacesAt: c ) >= 0) ifFalse: [c:=c+1] ]
]

{ #category : #accessing }
TreeNodes >> nameOf: aLine [
	"Gets the name of a function at a given line."
	|line|
	line := ((self withoutSpaces at: aLine) copyWithout: $-).
	( (aLine > 1) and: [(self percentageOf: aLine-1) = (self percentageOf: aLine)] ) 
		ifTrue: [ ^ line ] 
		ifFalse: [ ^ line last: (line size - ((self percentageOf: aLine) asString) size) -1 ]
	
]

{ #category : #accessing }
TreeNodes >> nodes [

	^ nodes
]

{ #category : #accessing }
TreeNodes >> nodes: aContent [
	nodes := aContent select: [:c | ((c copyWithout: (Character space)) copyWithout: $|) isNotEmpty ]
]

{ #category : #accessing }
TreeNodes >> numberOfFunctions [
	"Gives the number of non-unique functions mentioned in the file."
	^ nodes size
]

{ #category : #accessing }
TreeNodes >> numberOfSpacesAt: aNode [
	"Gives the number of spaces at a certain line."
	|count spacesAreEnded|
	count := 0.
	spacesAreEnded := false.
	(self nodes at: aNode) do: [:c | ((c ~= Character space) and: (c ~= $|))
		ifFalse: [
			spacesAreEnded ifFalse: [
				count := count+1 ] ]
		ifTrue: [ spacesAreEnded := true. ] ] . 
	^ count
]

{ #category : #accessing }
TreeNodes >> percentageOf: aLine [
	"Gives the percentage from a function at a given line"
	"In the case of multiples functions for one percentage, it gives the same percentage so it's precise yet."
	|line numbers|
	self assert: aLine >=1.
	line := self nodes at: aLine.
	
	numbers := ( ( ( (self withoutSpaces at: aLine) copyWithout: $-) first: 5) select: [:c | {$0.$1.$2.$3.$4.$5.$6.$7.$8.$9} asSet includes: c ]).
	( (aLine> 1) and: (numbers isEmpty) ) ifTrue: [^ self percentageOf: aLine-1].
	numbers size >= 4 
		ifTrue: [^ ((numbers first: 4) asInteger / 100) asFloat ]
		ifFalse: [^ ((numbers first: 3) asInteger / 100) asFloat ]
]

{ #category : #accessing }
TreeNodes >> withoutSpaces [
	"Gives a line without the characters that are not interesting."
	^ self nodes collect: [:n | (n copyWithout: Character space) copyWithout: $|]
]

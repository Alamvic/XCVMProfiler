Class {
	#name : #TreeChildren,
	#superclass : #Object,
	#instVars : [
		'parent',
		'children',
		'name',
		'percentage',
		'estimatedPercentage',
		'time',
		'weight'
	],
	#category : #TreeParser
}

{ #category : #accessing }
TreeChildren >> children [

	^ children
]

{ #category : #accessing }
TreeChildren >> children: aTreeChildren [

	children := aTreeChildren.
]

{ #category : #accessing }
TreeChildren >> estimatePercentage [
	"Estimate the real percentage of the function."
	"The instance variable percentage is the percentage of the function and its children."

	| sumOfPercents |
	sumOfPercents := 0.
	1 to: self children size do: [ :i |
		sumOfPercents := sumOfPercents + (self children at: i) percentage ].
	estimatedPercentage := percentage - sumOfPercents roundUpTo: 0.01.

	^ estimatedPercentage
]

{ #category : #accessing }
TreeChildren >> firstChildrenOf: aNumber [
	"Gives the children of the first children of each generations a given times."

	| child |
	child := self.
	1 to: aNumber do: [:c | child := child children first ].
	^ child
]

{ #category : #accessing }
TreeChildren >> isLeaf [

	^ self children isEmpty
]

{ #category : #accessing }
TreeChildren >> isNotLeaf [

	^ self children isNotEmpty
]

{ #category : #accessing }
TreeChildren >> leaves: leaves [

	self isLeaf
		ifTrue: [ leaves add: self.
			^ leaves ].
	
	^ (1 to: self children size do: [:i | (self children at: i) leaves: leaves ] )

]

{ #category : #accessing }
TreeChildren >> name [

	^ name
]

{ #category : #accessing }
TreeChildren >> name: aName [

	name := aName
]

{ #category : #accessing }
TreeChildren >> parent [

	^ parent
]

{ #category : #accessing }
TreeChildren >> parent: aTreeNode [

	parent := aTreeNode
]

{ #category : #accessing }
TreeChildren >> percentage [

	^ percentage
]

{ #category : #accessing }
TreeChildren >> percentage: aFloat [

	percentage := aFloat
]

{ #category : #accessing }
TreeChildren >> time [
	
	^ time
]

{ #category : #accessing }
TreeChildren >> time: aFloat [

	time := aFloat.
]

{ #category : #accessing }
TreeChildren >> traces [

	| leaves |
	leaves := OrderedCollection new.
	self leaves: leaves.
	
	^ leaves collect: [:l |
		TreeTrace new
			name: l name;
			weight: l weight ]
]

{ #category : #accessing }
TreeChildren >> weight [

	weight := ( self time * estimatedPercentage / 100 ) roundUpTo: 0.001.
	^ weight
]

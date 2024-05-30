Class {
	#name : #TreeChildren,
	#superclass : #Object,
	#instVars : [
		'parent',
		'children',
		'name',
		'percentage'
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

	| sumOfPercents |
	sumOfPercents := 0.
	self children collect: [ :n |
		sumOfPercents := n percentage + sumOfPercents ].
	
	percentage - sumOfPercents >= 0
		ifTrue: [ percentage := (percentage - sumOfPercents) roundUpTo: 0.01 ].
	^ percentage
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

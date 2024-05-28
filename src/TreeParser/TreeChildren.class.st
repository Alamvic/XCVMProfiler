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
	percentage := percentage - sumOfPercents
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

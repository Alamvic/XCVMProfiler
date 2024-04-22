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

{ #category : #properties }
TreeChildren class >> childrenOf: aTreeNode [
	^ self new
		parent: aTreeNode;
		children: self.
]

{ #category : #accessing }
TreeChildren >> children [
	^ children
]

{ #category : #accessing }
TreeChildren >> children: aTreeChildren [
	children := aTreeChildren.
]

{ #category : #accessing }
TreeChildren >> name [
	^ name
]

{ #category : #accessing }
TreeChildren >> name: aName [
	name := aName.
]

{ #category : #accessing }
TreeChildren >> parent [
	^ parent
]

{ #category : #accessing }
TreeChildren >> parent: aTreeNode [
	parent := aTreeNode.
]

{ #category : #accessing }
TreeChildren >> percentage [
	^ percentage
]

{ #category : #accessing }
TreeChildren >> percentage: aFloat [
	percentage := aFloat.
]

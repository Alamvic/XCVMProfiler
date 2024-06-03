Class {
	#name : #TreeNode,
	#superclass : #Object,
	#instVars : [
		'name',
		'weight',
		'parser',
		'index'
	],
	#category : #TreeParser
}

{ #category : #accessing }
TreeNode >> children [

	^ (parser findChildrenIndexOfIndex: index) collect: [ :childIndex |
		  parser nodeAtIndex: childIndex ]
]

{ #category : #accessing }
TreeNode >> index [

	^ index
]

{ #category : #accessing }
TreeNode >> index: anObject [

	index := anObject
]

{ #category : #accessing }
TreeNode >> name [

	^ name
]

{ #category : #accessing }
TreeNode >> name: anObject [

	name := anObject
]

{ #category : #accessing }
TreeNode >> parser [

	^ parser
]

{ #category : #accessing }
TreeNode >> parser: anObject [

	parser := anObject
]

{ #category : #accessing }
TreeNode >> weight [

	^ weight
]

{ #category : #accessing }
TreeNode >> weight: anObject [

	weight := anObject
]

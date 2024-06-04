Class {
	#name : #TreeNode,
	#superclass : #Object,
	#instVars : [
		'name',
		'weight',
		'children',
		'parent',
		'totalTime'
	],
	#category : #TreeParser
}

{ #category : #accessing }
TreeNode >> children [

	^ children
]

{ #category : #accessing }
TreeNode >> children: aCollectionOfTreeNode [

	children:= aCollectionOfTreeNode
]

{ #category : #accessing }
TreeNode >> firstChildrenOf: aNumber [
	"Gives the children of the first children of each generations a given times."

	| child |
	child := self.
	1 to: aNumber do: [ :c | child := child children first ].
	^ child
]

{ #category : #accessing }
TreeNode >> isLeaf [

	^ self children isEmpty
]

{ #category : #accessing }
TreeNode >> isNotLeaf [

	^ self children isNotEmpty
]

{ #category : #accessing }
TreeNode >> leaves: leaves [

	self isLeaf ifTrue: [
		leaves add: self.
		^ leaves ].

	^ self children collect: [ :child | child leaves: leaves ]
]

{ #category : #accessing }
TreeNode >> name [

	^ name
]

{ #category : #accessing }
TreeNode >> name: aString [

	name := aString
]

{ #category : #accessing }
TreeNode >> parent [

	^ parent
]

{ #category : #accessing }
TreeNode >> parent: aTreeNode [

	parent := aTreeNode
]

{ #category : #accessing }
TreeNode >> time [

	^ totalTime
]

{ #category : #accessing }
TreeNode >> time: aFloat [

	totalTime := aFloat
]

{ #category : #accessing }
TreeNode >> traces [

	| leaves |
	leaves := OrderedCollection new.
	self leaves: leaves.

	^ leaves collect: [ :l |
		  TreeTrace new
			  name: l name;
			  weight: l weight;
			  yourself ]
]

{ #category : #accessing }
TreeNode >> weight [

	^ weight
]

{ #category : #accessing }
TreeNode >> weight: aFloat [

	weight := aFloat
]

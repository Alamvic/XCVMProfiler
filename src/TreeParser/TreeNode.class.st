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
TreeNode >> collectLeavesIn: leaves [

	self isLeaf ifTrue: [
		leaves add: self.
		^ leaves ].

	^ self children collect: [ :child | child collectLeavesIn: leaves ]
]

{ #category : #accessing }
TreeNode >> firstChild [

	^ self children first
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
	self collectLeavesIn: leaves.

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

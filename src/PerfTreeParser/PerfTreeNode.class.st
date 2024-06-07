Class {
	#name : #PerfTreeNode,
	#superclass : #Object,
	#instVars : [
		'name',
		'weight',
		'children',
		'parent',
		'totalTime'
	],
	#category : #PerfTreeParser
}

{ #category : #accessing }
PerfTreeNode >> children [

	^ children
]

{ #category : #accessing }
PerfTreeNode >> children: aCollectionOfTreeNode [

	children:= aCollectionOfTreeNode
]

{ #category : #accessing }
PerfTreeNode >> collectLeavesIn: leaves [

	self isLeaf ifTrue: [
		leaves add: self.
		^ leaves ].

	^ self children collect: [ :child | child collectLeavesIn: leaves ]
]

{ #category : #accessing }
PerfTreeNode >> firstChild [

	^ self children first
]

{ #category : #accessing }
PerfTreeNode >> isLeaf [

	^ self children isEmpty
]

{ #category : #accessing }
PerfTreeNode >> isNotLeaf [

	^ self children isNotEmpty
]

{ #category : #accessing }
PerfTreeNode >> name [

	^ name
]

{ #category : #accessing }
PerfTreeNode >> name: aString [

	name := aString
]

{ #category : #accessing }
PerfTreeNode >> parent [

	^ parent
]

{ #category : #accessing }
PerfTreeNode >> parent: aTreeNode [

	parent := aTreeNode
]

{ #category : #accessing }
PerfTreeNode >> time [

	^ totalTime
]

{ #category : #accessing }
PerfTreeNode >> time: aFloat [

	totalTime := aFloat
]

{ #category : #accessing }
PerfTreeNode >> traces [

	| leaves |
	leaves := OrderedCollection new.
	self collectLeavesIn: leaves.

	^ leaves collect: [ :l |
		  PerfTreeTrace new
			  name: l name;
			  weight: l weight;
			  yourself ]
]

{ #category : #accessing }
PerfTreeNode >> weight [

	^ weight
]

{ #category : #accessing }
PerfTreeNode >> weight: aFloat [

	weight := aFloat
]

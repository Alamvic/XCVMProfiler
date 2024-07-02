Class {
	#name : 'PerfTreeNode',
	#superclass : 'Object',
	#instVars : [
		'name',
		'children',
		'parent',
		'totalTime',
		'time',
		'timeWithChildren',
		'rawPercentage'
	],
	#category : 'PerfTreeParser',
	#package : 'PerfTreeParser'
}

{ #category : 'accessing' }
PerfTreeNode >> children [

	^ children
]

{ #category : 'accessing' }
PerfTreeNode >> children: aCollectionOfTreeNode [

	children:= aCollectionOfTreeNode
]

{ #category : 'accessing' }
PerfTreeNode >> collectLeavesIn: leaves [

	(self isLeaf and: [ self isNotAlreadyLeafIn: leaves ]) ifTrue: [
		leaves add: self ].

	self children do: [ :child | child collectLeavesIn: leaves ].

	^ leaves
]

{ #category : 'accessing' }
PerfTreeNode >> firstChild [

	^ self children first
]

{ #category : 'accessing' }
PerfTreeNode >> isFromInstruments [

	^ false
]

{ #category : 'accessing' }
PerfTreeNode >> isLeaf [

	^ self children isEmpty
]

{ #category : 'accessing' }
PerfTreeNode >> isNotAlreadyLeafIn: leaves [

	(leaves anySatisfy: [ :leaf |
		 leaf name = self name and: [ leaf time = self time ] ])
		ifTrue: [ ^ false ]
		ifFalse: [ ^ true ]
]

{ #category : 'accessing' }
PerfTreeNode >> isNotLeaf [

	^ self children isNotEmpty
]

{ #category : 'accessing' }
PerfTreeNode >> name [

	^ name
]

{ #category : 'accessing' }
PerfTreeNode >> name: aString [

	name := aString
]

{ #category : 'accessing' }
PerfTreeNode >> parent [

	^ parent
]

{ #category : 'accessing' }
PerfTreeNode >> parent: aTreeNode [

	parent := aTreeNode
]

{ #category : 'accessing' }
PerfTreeNode >> rawPercentage [

	^ rawPercentage
]

{ #category : 'accessing' }
PerfTreeNode >> rawPercentage: anObject [

	rawPercentage := anObject
]

{ #category : 'accessing' }
PerfTreeNode >> time [

	^ time
]

{ #category : 'accessing' }
PerfTreeNode >> time: aFloat [

	time := aFloat
]

{ #category : 'accessing' }
PerfTreeNode >> timeWithChildren [

	^ timeWithChildren
]

{ #category : 'accessing' }
PerfTreeNode >> timeWithChildren: anObject [

	timeWithChildren := anObject
]

{ #category : 'accessing' }
PerfTreeNode >> totalTime [

	^ totalTime
]

{ #category : 'accessing' }
PerfTreeNode >> totalTime: aFloat [

	totalTime := aFloat
]

{ #category : 'accessing' }
PerfTreeNode >> traces [

	| leaves |
	leaves := OrderedCollection new.
	self collectLeavesIn: leaves.

	^ leaves collect: [ :l |
		  PerfTreeTrace new
			  name: l name;
			  time: l time;
			  rawPercentage: l rawPercentage;
			  yourself ]
]

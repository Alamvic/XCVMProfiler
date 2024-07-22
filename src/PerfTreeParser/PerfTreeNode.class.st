Class {
	#name : 'PerfTreeNode',
	#superclass : 'Object',
	#instVars : [
		'name',
		'totalTime',
		'time',
		'rawPercentage',
		'child',
		'parents',
		'timeWithParents'
	],
	#category : 'PerfTreeParser',
	#package : 'PerfTreeParser'
}

{ #category : 'accessing' }
PerfTreeNode >> child [

	^ child
]

{ #category : 'accessing' }
PerfTreeNode >> child: aCollectionOfTreeNode [

	child:= aCollectionOfTreeNode
]

{ #category : 'accessing' }
PerfTreeNode >> collectLeavesIn: leaves [

	(self isLeaf and: [ self isNotAlreadyLeafIn: leaves ]) ifTrue: [
		leaves add: self ].

	self parents do: [ :parent | parent collectLeavesIn: leaves ].

	^ leaves
]

{ #category : 'accessing' }
PerfTreeNode >> firstParent [

	^ self parents first
]

{ #category : 'accessing' }
PerfTreeNode >> isLeaf [

	^ self child isNil
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

	^ self child isNotNil
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
PerfTreeNode >> parents [

	^ parents
]

{ #category : 'accessing' }
PerfTreeNode >> parents: aTreeNode [

	parents := aTreeNode
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
PerfTreeNode >> timeWithParents [

	^ timeWithParents
]

{ #category : 'accessing' }
PerfTreeNode >> timeWithParents: anObject [

	timeWithParents := anObject
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

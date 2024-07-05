Class {
	#name : 'PerfTreeTree',
	#superclass : 'Object',
	#instVars : [
		'traces'
	],
	#category : 'PerfTreeParser',
	#package : 'PerfTreeParser'
}

{ #category : 'accessing' }
PerfTreeTree >> hardestCall [

	"Comment"
	| hardest |
	traces ifEmpty: [ ^ nil ] ifNotEmpty: [ hardest := traces first ].
	traces do: [:trace | trace rawPercentage asNumber > hardest rawPercentage asNumber ifTrue: [ hardest := trace ] ].
	^ hardest
]

{ #category : 'accessing' }
PerfTreeTree >> totalTime [

	^ traces sum: [:trace | trace time ]
]

{ #category : 'accessing' }
PerfTreeTree >> traces [

	^ traces
]

{ #category : 'accessing' }
PerfTreeTree >> traces: aCollectionOfTraces [

	traces := aCollectionOfTraces
]

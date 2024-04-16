Class {
	#name : #XCTraceSample,
	#superclass : #XCAbstractTraceObject,
	#instVars : [
		'tree',
		'primitiveName'
	],
	#category : #XCTrace
}

{ #category : #'instance creation' }
XCTraceSample class >> tree: aXCTraceTree node: aXMLElement [

	^ self new
		  tree: aXCTraceTree;
		  node: aXMLElement;
		  yourself
]

{ #category : #accessing }
XCTraceSample >> primitiveName [
	
	primitiveName ifNotNil: [ ^ primitiveName ].
	
	self stackTrace frames do: [ :e | | name |
		name := (e attributeAt: #name).
		(name beginsWith: 'primitive') ifTrue: [ ^ primitiveName := name ] ].
	self error: 'Not a primitive sample!'
]

{ #category : #'api - accessing' }
XCTraceSample >> sampleTime [

	^ self childNamed: 'sample-time'
]

{ #category : #accessing }
XCTraceSample >> stackTrace [

	| backtraceNode |
	backtraceNode := self childNamed: 'backtrace' ifAbsent: [ nil ].
	^ XCBacktrace sample: self node: backtraceNode
]

{ #category : #accessing }
XCTraceSample >> threadId [
	
	^ self childNamed: 'thread'
]

{ #category : #'api - accessing' }
XCTraceSample >> tree [

	^ tree
]

{ #category : #accessing }
XCTraceSample >> tree: aXCTraceTree [ 
	tree := aXCTraceTree
]

{ #category : #'api - accessing' }
XCTraceSample >> weight [

	^ self childNamed: 'weight'
]

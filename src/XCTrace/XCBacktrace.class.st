Class {
	#name : #XCBacktrace,
	#superclass : #XCAbstractTraceObject,
	#instVars : [
		'sample'
	],
	#category : #XCTrace
}

{ #category : #'instance creation' }
XCBacktrace class >> sample: aXCTraceSample node: aXMLElement [

	^ self new
		sample: aXCTraceSample;
		node: aXMLElement;
		yourself
]

{ #category : #accessing }
XCBacktrace >> frameNameAt: pos [
	
	^ (self frames at: pos) attributeAt: 'name'
]

{ #category : #accessing }
XCBacktrace >> frames [
	
	node ifNil: [ ^ #() ].
	^ self childrenNamed: 'frame'
]

{ #category : #accessing }
XCBacktrace >> sample: aXCTraceSample [ 
	sample := aXCTraceSample
]

{ #category : #'api - accessing' }
XCBacktrace >> tree [

	^ sample tree
]

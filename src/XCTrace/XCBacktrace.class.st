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
XCBacktrace >> frameAt: pos [
	
	^ (self frames at: pos)
]

{ #category : #accessing }
XCBacktrace >> frameNameAt: pos [
	
	^ (self frameAt: pos) attributeAt: 'name'
]

{ #category : #accessing }
XCBacktrace >> frames [
	
	node ifNil: [ ^ #() ].
	^ (self node elementsCollect: [:e | e]) asOrderedCollection
]

{ #category : #accessing }
XCBacktrace >> sample: aXCTraceSample [ 
	sample := aXCTraceSample
]

{ #category : #'api - accessing' }
XCBacktrace >> tree [

	^ sample tree
]

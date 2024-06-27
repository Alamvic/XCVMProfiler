Class {
	#name : 'XCTraceTree',
	#superclass : 'Object',
	#instVars : [
		'dom',
		'samples',
		'indexes'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'instance creation' }
XCTraceTree class >> fromTimeProfileFileReference: aFileReference [ 
	
	^ self new
		dom: (XMLDOMParser parse: aFileReference);
		yourself
]

{ #category : 'accessing' }
XCTraceTree >> dom: aXMLDocument [ 
	
	dom := aXMLDocument
]

{ #category : 'initialization' }
XCTraceTree >> indexAt: aName [

	^ indexes at: aName ifAbsentPut: [ Dictionary new ]
]

{ #category : 'accessing' }
XCTraceTree >> indexAt: aString atId: anId [

	^ (self indexAt: aString) at: anId
]

{ #category : 'accessing' }
XCTraceTree >> indexAt: indexName atId: id put: aValue [

	^ (self indexAt: indexName) at: id ifAbsentPut: aValue
]

{ #category : 'initialization' }
XCTraceTree >> initialize [

	super initialize.
	indexes := Dictionary new
]

{ #category : 'accessing' }
XCTraceTree >> rootTime [
	
	^ (self samples collect: [ :s | s weight ]) sum
]

{ #category : 'accessing - structure variables' }
XCTraceTree >> samples [

	^ samples ifNil: [
		  samples := dom root elements first elements asOrderedCollection
			             select: [ :node | node name = 'row' ]
			             thenCollect: [ :sampleNode |
				self haltIf: [ sampleNode isNil ].
			             XCTraceSample tree: self node: sampleNode ] ]
]

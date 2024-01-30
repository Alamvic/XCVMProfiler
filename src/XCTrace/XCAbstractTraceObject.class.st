Class {
	#name : #XCAbstractTraceObject,
	#superclass : #Object,
	#instVars : [
		'node'
	],
	#category : #XCTrace
}

{ #category : #'api - accessing' }
XCAbstractTraceObject >> childNamed: aPropertyName [

	^ self childNamed: aPropertyName ifAbsent: [ self error ]
]

{ #category : #'api - accessing' }
XCAbstractTraceObject >> childNamed: aPropertyName ifAbsent: aBlock [

	| children |
	children := self
		            childrenNamed: aPropertyName
		            ifAbsent: [ ^ aBlock value ].
	self assert: children size = 1.
	^ children first
]

{ #category : #'api - accessing' }
XCAbstractTraceObject >> childrenNamed: aPropertyName [

	^ node elements
		  select: [ :e | e name = aPropertyName ]
		  thenCollect: [ :subnode |
			  (subnode includesAttribute: 'id')
				  ifTrue: [
					  self tree
						  indexAt: aPropertyName
						  atId: (subnode attributeAt: 'id')
						  put: subnode ]
				  ifFalse: [
				  self tree
					  indexAt: aPropertyName
					  atId: (subnode attributeAt: 'ref') ] ]
]

{ #category : #'api - accessing' }
XCAbstractTraceObject >> childrenNamed: aPropertyName ifAbsent: aBlock [

	| children |
	children := self childrenNamed: aPropertyName.
	children isEmpty ifTrue: [ aBlock value ].
	^ children
]

{ #category : #accessing }
XCAbstractTraceObject >> node: aXMLElement [ 
	node := aXMLElement
]

{ #category : #'api - accessing' }
XCAbstractTraceObject >> tree [

	self subclassResponsibility
]

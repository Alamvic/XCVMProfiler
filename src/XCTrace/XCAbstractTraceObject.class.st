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
	(children first size = 1)
		ifTrue: [^ children first first] 
		ifFalse: [^ children first].
	
]

{ #category : #'api - accessing' }
XCAbstractTraceObject >> childrenNamed: aPropertyName [

	^ (self node
		nodesSelect: [:e | ((e class = XMLElement) and: [e name = aPropertyName] )] )
		collect: [:subnode | (subnode nodes) asString 
			ifNotEmpty: [subnode nodes]
			ifEmpty: [(subnode includesAttribute: 'fmt')
				ifTrue: [subnode attributeAt: 'fmt']
				ifFalse: [ subnode attributeAt: 'name'] ]]

]

{ #category : #'api - accessing' }
XCAbstractTraceObject >> childrenNamed: aPropertyName ifAbsent: aBlock [

	| children |
	children := self childrenNamed: aPropertyName.
	children isEmpty ifTrue: [ aBlock value ].
	^ children
]

{ #category : #accessing }
XCAbstractTraceObject >> node [ 
	^ node
]

{ #category : #accessing }
XCAbstractTraceObject >> node: aXMLElement [ 
	node := aXMLElement
]

{ #category : #'api - accessing' }
XCAbstractTraceObject >> tree [

	self subclassResponsibility
]

Class {
	#name : 'VMBenchSQLTest',
	#superclass : 'TestCase',
	#instVars : [
		'getter'
	],
	#category : 'VMBenchSQL-Tests',
	#package : 'VMBenchSQL-Tests'
}

{ #category : 'running' }
VMBenchSQLTest >> setUp [

	| str |
	super setUp.
	str := 'Machine Code	10687.130000000005
Trampolines	110.71
MC -> Primitive	0
compilation	49.61
interpret	0
Interpreter -> Primitive	96.79


Total	10944.240000000005'.
	
	getter := VMBenchGetter fromContent: str
]

{ #category : 'running' }
VMBenchSQLTest >> tearDown [

	super tearDown
]

{ #category : 'running' }
VMBenchSQLTest >> testSizeOfStructuredContent [
	"There is 6 categories with the Total category."

	self assert: getter structuredContent size equals: 7
]

{ #category : 'running' }
VMBenchSQLTest >> testStructuredContent [

	self assert: (getter structuredContent at: ' MC -> Primitive') isZero.

	self
		assert: (getter structuredContent at: ' compilation')
		equals: 49.61
]

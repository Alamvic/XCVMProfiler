Class {
	#name : 'VMBenchSQLTest',
	#superclass : 'TestCase',
	#instVars : [
		'getter',
		'testClient',
		'testContent',
		'testExporter'
	],
	#category : 'VMBenchSQL-Tests',
	#package : 'VMBenchSQL-Tests'
}

{ #category : 'running' }
VMBenchSQLTest >> setUp [

	super setUp.
	testContent := 'Machine Code	10687.13
Trampolines	110.71
MC -> Primitive	0
compilation	49.61
interpret	0
Interpreter -> Primitive	96.79


Total	10944.24'.

	getter := VMBenchGetter fromContent: testContent.
	testClient := P3Client new url:
		              'psql://postgres:postgres@localhost:5432/postgres'.
	testClient connect.

	testExporter := VMBenchSQLExporter new
		                client: testClient;
		                content: getter structuredContent;
		                timeStamp: Date today yyyymmdd;
		                tableName: 'bench';
		                yourself
]

{ #category : 'running' }
VMBenchSQLTest >> tearDown [

	testClient execute: 'DROP TABLE IF EXISTS ' , 'bench'.
	testClient close.
	super tearDown
]

{ #category : 'running' }
VMBenchSQLTest >> testExport [

	self
		assert: testExporter export first second
		equals: testExporter export second second.

	self assert: testExporter export second first equals: 2
]

{ #category : 'running' }
VMBenchSQLTest >> testExportSize [

	self assert: testExporter export size equals: 7.

	self assert: testExporter export first size equals: 5
]

{ #category : 'running' }
VMBenchSQLTest >> testSizeOfStructuredContent [
	"There is 6 categories with the Total category."

	self assert: getter structuredContent size equals: 7
]

{ #category : 'running' }
VMBenchSQLTest >> testStructuredContent [

	self assert: (getter structuredContent at: 'MC -> Primitive') isZero.

	self
		assert: (getter structuredContent at: 'compilation')
		equals: 49.61
]

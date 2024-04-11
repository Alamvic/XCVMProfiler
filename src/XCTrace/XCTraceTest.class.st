Class {
	#name : #XCTraceTest,
	#superclass : #TestCase,
	#instVars : [
		'fr',
		'tree',
		'frEmpty',
		'treeEmpty'
	],
	#category : #'XCTrace-Tests'
}

{ #category : #running }
XCTraceTest >> setUp [
	super setUp.
	fr := (FileLocator home / 'pharo/pharo-local/iceberg/XCVMProfiler/resources/test-profile.trace') asFileReference.
	tree := XCTraceTree fromTimeProfileFileReference: fr.

	frEmpty := (FileLocator home / 'pharo/pharo-local/iceberg/XCVMProfiler/resources/test-empty-profile.trace') asFileReference.
	treeEmpty := XCTraceTree fromTimeProfileFileReference: frEmpty.

]

{ #category : #'as yet unclassified' }
XCTraceTest >> testContentOfProfiler [
	"""
	Needs a rework.
	|treeSamples profiler names|.
	treeSamples := tree samples.
	profiler := 	XCVMProfiler default classify: treeSamples.
	names := profiler threads collect: [:p |
		p pointsOfInterest do: [:n |
			{'Machine Code'.'Trampolines'.'MC -> Primitive'.'compilation'.'interpret'.'Interpreter -> Primitive'} includes: (n name)]].
	"""
]

{ #category : #'basic tests' }
XCTraceTest >> testSizeOfEmptySample [
	self assert: treeEmpty samples size equals: 0.
	
]

{ #category : #'basic tests' }
XCTraceTest >> testSizeOfSamplesWithContent [
	self assert: tree samples size equals: 2.
	
]

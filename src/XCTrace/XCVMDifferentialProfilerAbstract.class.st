Class {
	#name : 'XCVMDifferentialProfilerAbstract',
	#superclass : 'Object',
	#instVars : [
		'profiles',
		'files'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'instance creation' }
XCVMDifferentialProfilerAbstract class >> onFiles: aCollection [ 
	
	^ self new
		files: aCollection;
		yourself
]

{ #category : 'accessing' }
XCVMDifferentialProfilerAbstract >> files: anObject [

	files := anObject
]

{ #category : 'accessing' }
XCVMDifferentialProfilerAbstract >> profiles [

	^ profiles ifNil: [
		  profiles := files collect: [ :file |
			              (file contents beginsWith: #<)
				              ifTrue: [
					              XCVMProfiler default classify:
						              (XCTraceTree fromTimeProfileFileReference: file)
							              samples ]
				              ifFalse: [
					              XCVMProfiler default classify: (PerfTreeParser parseFile: file) ] ] ]
]

{ #category : 'as yet unclassified' }
XCVMDifferentialProfilerAbstract >> table [
	^ self subclassResponsibility
]

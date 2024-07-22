Class {
	#name : 'VMDifferentialProfilerAbstract',
	#superclass : 'Object',
	#instVars : [
		'profiles',
		'files'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'instance creation' }
VMDifferentialProfilerAbstract class >> onFiles: aCollection [ 
	
	^ self new
		files: aCollection;
		yourself
]

{ #category : 'accessing' }
VMDifferentialProfilerAbstract >> files: anObject [

	files := anObject
]

{ #category : 'accessing' }
VMDifferentialProfilerAbstract >> profiles [

	^ profiles ifNil: [
		  profiles := files collect: [ :file |
			              (file contents beginsWith: #<)
				              ifTrue: [
					              VMProfiler default classify:
						              (XCTraceTree fromTimeProfileFileReference: file)
							              samples ]
				              ifFalse: [
					              VMProfiler default classify: (PerfTreeParser parseFile: file) ] ] ]
]

{ #category : 'accessing' }
VMDifferentialProfilerAbstract >> table [
	^ self subclassResponsibility
]

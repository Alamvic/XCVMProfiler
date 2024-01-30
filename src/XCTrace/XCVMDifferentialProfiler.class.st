Class {
	#name : #XCVMDifferentialProfiler,
	#superclass : #Object,
	#instVars : [
		'profiles',
		'files'
	],
	#category : #XCTrace
}

{ #category : #'instance creation' }
XCVMDifferentialProfiler class >> onFiles: aCollection [ 
	
	^ self new
		files: aCollection;
		yourself
]

{ #category : #accessing }
XCVMDifferentialProfiler >> files: aCollection [ 
	
	files := aCollection
]

{ #category : #accessing }
XCVMDifferentialProfiler >> profiles [

	^ profiles ifNil: [
		  profiles := files collect: [ :file |
			              XCVMProfiler default classify:
				              (XCTraceTree fromTimeProfileFileReference: file)
					              samples ] ]
]

{ #category : #accessing }
XCVMDifferentialProfiler >> table [

	^ (String crlf join:
		   (#( 'Machine Code' Trampolines 'MC -> Primitive'
		       compilation interpret 'Interpreter -> Primitive' ) collect: [
			    :concern |
			    String tab join: (self profiles collect: [ :e |
					     ((e value threads at: '2') totalTimes associations detect: [
						      :a | a key name = concern ]) value ]) ])) , String crlf
	  , String crlf , String crlf
	  , (String tab join: (self profiles collect: [ :p |
				    (p value threads at: '2') totalSamples asString ]))
]

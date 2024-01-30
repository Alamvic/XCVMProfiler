Class {
	#name : #XCVMDifferentialPrimitiveProfiler,
	#superclass : #Object,
	#instVars : [
		'profiles',
		'files'
	],
	#category : #XCTrace
}

{ #category : #'instance creation' }
XCVMDifferentialPrimitiveProfiler class >> onFiles: aCollection [ 
	
	^ self new
		files: aCollection;
		yourself
]

{ #category : #accessing }
XCVMDifferentialPrimitiveProfiler >> files: aCollection [ 
	
	files := aCollection
]

{ #category : #accessing }
XCVMDifferentialPrimitiveProfiler >> primitiveNames [
	
	"Assume all will have the same primitives listed for now"
	| oneProfile poi thread |
	oneProfile := self profiles anyOne.
	thread := oneProfile threads at: '2'.
	poi := thread pointOfInterestWithId: 'MC -> Primitive'.
	^ (thread samplesForPoi: poi) collect: [:e | e primitiveName ] as: Set.
]

{ #category : #accessing }
XCVMDifferentialPrimitiveProfiler >> profiles [

	^ profiles ifNil: [
		  profiles := files collect: [ :file |
			              XCVMProfiler default classify:
				              (XCTraceTree fromTimeProfileFileReference: file)
					              samples ] ]
]

{ #category : #accessing }
XCVMDifferentialPrimitiveProfiler >> samplesForPrimitive: aString [

	^ self profiles collect: [ :oneProfile |
		| poi thread |
		thread := oneProfile threads at: '2'.
		poi := thread pointOfInterestWithId: 'MC -> Primitive'.
		(thread samplesForPoi: poi) select: [ :e |
			e primitiveName = aString ] ]
]

{ #category : #accessing }
XCVMDifferentialPrimitiveProfiler >> table [

	| samplesPerPrimitive lines |
	samplesPerPrimitive := self primitiveNames collect: [ :p |
		                       p -> (self samplesForPrimitive: p) ].

	"Now tabularize"
	lines := samplesPerPrimitive collect: [ :primitiveSamples |
		         { primitiveSamples key }
		         , (primitiveSamples value collect: #size) ].

	^ String crlf join: (lines collect: [ :l | String tab join: l ])
]

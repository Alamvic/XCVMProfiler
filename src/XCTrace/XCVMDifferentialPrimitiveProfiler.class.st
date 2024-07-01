Class {
	#name : 'XCVMDifferentialPrimitiveProfiler',
	#superclass : 'XCVMDifferentialProfilerAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCVMDifferentialPrimitiveProfiler >> primitiveNames [
	
	"Assume all will have the same primitives listed for now"
	| oneProfile poi thread |
	oneProfile := self profiles anyOne.
	thread := oneProfile threads at: (oneProfile threads keys second).
	poi := thread pointOfInterestWithId: 'MC -> Primitive'.
	^ (thread samplesForPoi: poi) collect: [:e | e primitiveName ] as: Set.
]

{ #category : 'accessing' }
XCVMDifferentialPrimitiveProfiler >> samplesForPrimitive: aString [

	^ self profiles collect: [ :oneProfile |
		| poi thread |
		thread := oneProfile threads at: (oneProfile threads keys second).
		poi := thread pointOfInterestWithId: 'MC -> Primitive'.
		(thread samplesForPoi: poi) select: [ :e |
			e primitiveName = aString ] ]
]

{ #category : 'accessing' }
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

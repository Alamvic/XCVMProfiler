Class {
	#name : 'VMProfiler',
	#superclass : 'Object',
	#instVars : [
		'threads',
		'pointsOfInterest'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMProfiler class >> default [

	^ self new
		  addPointOfInterest:
			  ((VMCompositePointOfInterest named: 'compilation')
					addPointOfInterestForFunctionNamed: 'enerageCogFullBlock';
				   addPointOfInterestForFunctionNamed: 'ompileCogMethod';
				   addPointOfInterestForFunctionNamed: 'cogselector';
				   yourself);
		  addPointOfInterest: ((VMCompositePointOfInterest named: 'gc')
				   addPointOfInterestForFunctionNamed: 'fullGC';
				   yourself);
		  addPointOfInterestForFunctionNamed: 'interpret';
		  addPointOfInterest: ((VMCompositePointOfInterest named: 'others')
				   addPointOfInterestForFunctionNamed: 'handleStackOverflow';
				   addPointOfInterestForFunctionNamed: 'loadPharoImage';
				   addPointOfInterestForFunctionNamed: 'reportStackState';
				   addPointOfInterestForFunctionNamed: 'beatStateMachine';
				   addPointOfInterestForFunctionNamed:
					   'interpretMethodFromMachineCode';
				   addPointOfInterestForFunctionNamed: 'ceNonLocalReturn';
				   yourself);
		  addPointOfInterest: VMMCPointOfInterest new;
		  addPointOfInterest: VMPrimitiveFromMCPointOfInterest new;
		  addPointOfInterest: VMPrimitiveFromInterpreterPointOfInterest new;
		  addPointOfInterest: VMTrampolinePointOfInterest new;
		  yourself
]

{ #category : 'adding' }
VMProfiler >> addPointOfInterest: aPointOfInterest [
	
	pointsOfInterest add: aPointOfInterest
]

{ #category : 'adding' }
VMProfiler >> addPointOfInterestForFunctionNamed: aString [

	self addPointOfInterest:
		(VMFunctionCallPointOfInterest named: aString)
]

{ #category : 'classification' }
VMProfiler >> classify: samples [
	"The samples should be treated in order because of their internal crossed references..."

	samples do: [ :sample | self classifySample: sample ]
]

{ #category : 'classification' }
VMProfiler >> classifySample: sample [

	| threadProfiler |
	threadProfiler := sample isFromInstruments
		                  ifTrue: [
			                  threads at: sample threadId ifAbsentPut: [
				                  | tp |
				                  tp := VMThreadProfiler new.
				                  pointsOfInterest do: [ :e |
					                  tp addPointOfInterest: e ].
				                  tp ] ]
		                  ifFalse: [
			                  threads at: sample name ifAbsentPut: [
				                  | tp |
				                  tp := VMThreadProfiler new.
				                  pointsOfInterest do: [ :e |
					                  tp addPointOfInterest: e ].
				                  tp ] ].
	^ threadProfiler classifySample: sample
]

{ #category : 'initialization' }
VMProfiler >> initialize [

	super initialize.
	threads := Dictionary new.
	pointsOfInterest := Set new
]

{ #category : 'accessing' }
VMProfiler >> threads [
	^ threads
]

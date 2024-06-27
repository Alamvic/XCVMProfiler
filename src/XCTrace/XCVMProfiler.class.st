Class {
	#name : 'XCVMProfiler',
	#superclass : 'Object',
	#instVars : [
		'threads',
		'pointsOfInterest'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCVMProfiler class >> default [

	^ self new
		  addPointOfInterest:
			  ((XCCompositePointOfInterest named: 'compilation')
					addPointOfInterestForFunctionNamed: 'enerageCogFullBlock';
				   addPointOfInterestForFunctionNamed: 'ompileCogMethod';
				   addPointOfInterestForFunctionNamed: 'cogselector';
				   yourself);
		  addPointOfInterest: ((XCCompositePointOfInterest named: 'gc')
				   addPointOfInterestForFunctionNamed: 'fullGC';
				   yourself);
		  addPointOfInterestForFunctionNamed: 'interpret';
		  addPointOfInterest: ((XCCompositePointOfInterest named: 'others')
				   addPointOfInterestForFunctionNamed: 'handleStackOverflow';
				   addPointOfInterestForFunctionNamed: 'loadPharoImage';
				   addPointOfInterestForFunctionNamed: 'reportStackState';
				   addPointOfInterestForFunctionNamed: 'beatStateMachine';
				   addPointOfInterestForFunctionNamed:
					   'interpretMethodFromMachineCode';
				   addPointOfInterestForFunctionNamed: 'ceNonLocalReturn';
				   yourself);
		  addPointOfInterest: XCMCPointOfInterest new;
		  addPointOfInterest: XCPrimitiveFromMCPointOfInterest new;
		  addPointOfInterest: XCPrimitiveFromInterpreterPointOfInterest new;
		  addPointOfInterest: XCTrampolinePointOfInterest new;
		  yourself
]

{ #category : 'adding' }
XCVMProfiler >> addPointOfInterest: aPointOfInterest [
	
	pointsOfInterest add: aPointOfInterest
]

{ #category : 'adding' }
XCVMProfiler >> addPointOfInterestForFunctionNamed: aString [

	self addPointOfInterest:
		(XCFunctionCallPointOfInterest named: aString)
]

{ #category : 'classification' }
XCVMProfiler >> classify: samples [
	"The samples should be treated in order because of their internal crossed references..."

	samples do: [ :sample | self classifySample: sample ]
]

{ #category : 'classification' }
XCVMProfiler >> classifySample: sample [

	| threadProfiler |
	threadProfiler := sample isFromInstruments
		                  ifTrue: [
			                  threads at: sample threadId ifAbsentPut: [
				                  | tp |
				                  tp := XCThreadProfiler new.
				                  pointsOfInterest do: [ :e |
					                  tp addPointOfInterest: e ].
				                  tp ] ]
		                  ifFalse: [
			                  threads at: sample name ifAbsentPut: [
				                  | tp |
				                  tp := XCThreadProfiler new.
				                  pointsOfInterest do: [ :e |
					                  tp addPointOfInterest: e ].
				                  tp ] ].
	^ threadProfiler classifySample: sample
]

{ #category : 'initialization' }
XCVMProfiler >> initialize [

	super initialize.
	threads := Dictionary new.
	pointsOfInterest := Set new
]

{ #category : 'accessing' }
XCVMProfiler >> threads [
	^ threads
]

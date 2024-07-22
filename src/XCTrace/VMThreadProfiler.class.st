Class {
	#name : 'VMThreadProfiler',
	#superclass : 'Object',
	#instVars : [
		'pointsOfInterest',
		'unclassified'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'adding' }
VMThreadProfiler >> addPointOfInterest: aPoi [

	pointsOfInterest at: aPoi put: OrderedCollection new
]

{ #category : 'adding' }
VMThreadProfiler >> addPointOfInterestForFunction: aString [

	self addPointOfInterest:
		(VMFunctionCallPointOfInterest named: aString)
]

{ #category : 'classification' }
VMThreadProfiler >> classify: samples [

	samples do: [ :e |
		| poi |
		poi := self pointOfInterestForSample: e.
		(pointsOfInterest at: poi) add: e ]
]

{ #category : 'classification' }
VMThreadProfiler >> classifySample: aSample [

	| poi |
	poi := self pointOfInterestForSample: aSample.
	(pointsOfInterest at: poi) add: aSample.
	^ poi
]

{ #category : 'initialization' }
VMThreadProfiler >> initialize [

	super initialize.
	pointsOfInterest := Dictionary new.

	self addPointOfInterest:
		(unclassified := VMUnclassifiedPointOfInterest new)
]

{ #category : 'as yet unclassified' }
VMThreadProfiler >> percentages [
	
	| total |
	total := self totalSamples.
	^ pointsOfInterest collect: [ :samples | ((samples size / total) * 100) asFloat ]
]

{ #category : 'accessing' }
VMThreadProfiler >> pointOfInterestForSample: aSample [

	| pois tracesNames |
	pois := self pointsOfInterest.
	tracesNames := aSample tracesNames.

	tracesNames doWithIndex: [ :e :i |
		pois keys
			detect: [ :poi | poi wantsFrame: e index: i frames: tracesNames ]
			ifFound: [ :found | ^ found ] ].

	^ unclassified
]

{ #category : 'accessing' }
VMThreadProfiler >> pointOfInterestWithId: aString [ 
	
	^ pointsOfInterest keys detect: [ :e | e name = aString ]
]

{ #category : 'accessing' }
VMThreadProfiler >> pointsOfInterest [

	^ pointsOfInterest
]

{ #category : 'accessing' }
VMThreadProfiler >> samplesForPoi: aPoi [ 
	
	^ pointsOfInterest at: aPoi
]

{ #category : 'accessing' }
VMThreadProfiler >> totalSamples [
	
	^ pointsOfInterest sum: [ :e | e size ]
]

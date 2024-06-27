Class {
	#name : 'XCThreadProfiler',
	#superclass : 'Object',
	#instVars : [
		'pointsOfInterest',
		'unclassified'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'adding' }
XCThreadProfiler >> addPointOfInterest: aPoi [

	pointsOfInterest at: aPoi put: OrderedCollection new
]

{ #category : 'adding' }
XCThreadProfiler >> addPointOfInterestForFunction: aString [

	self addPointOfInterest:
		(XCFunctionCallPointOfInterest named: aString)
]

{ #category : 'classification' }
XCThreadProfiler >> classify: samples [

	samples do: [ :e |
		| poi |
		poi := self pointOfInterestForSample: e.
		(pointsOfInterest at: poi) add: e ]
]

{ #category : 'classification' }
XCThreadProfiler >> classifySample: aSample [

	| poi |
	poi := self pointOfInterestForSample: aSample.
	(pointsOfInterest at: poi) add: aSample.
	^ poi
]

{ #category : 'adding' }
XCThreadProfiler >> initialize [

	super initialize.
	pointsOfInterest := Dictionary new.

	self addPointOfInterest:
		(unclassified := XCUnclassifiedPointOfInterest new)
]

{ #category : 'as yet unclassified' }
XCThreadProfiler >> percentages [
	
	| total |
	total := self totalSamples.
	^ pointsOfInterest collect: [ :samples | ((samples size / total) * 100) asFloat ]
]

{ #category : 'accessing' }
XCThreadProfiler >> pointOfInterestForSample: aSample [

	| pois framesNames |
	pois := self pointsOfInterest.
	framesNames := aSample isFromInstruments
		               ifTrue: [ aSample stackTrace framesNames ]
		               ifFalse: [
		               aSample traces collect: [ :trace | trace name ] ].

	framesNames doWithIndex: [ :e :i |
		pois
			detect: [ :poi | poi wantsFrame: e index: i frames: framesNames ]
			ifFound: [ :found | ^ found ] ].

	^ unclassified
]

{ #category : 'accessing' }
XCThreadProfiler >> pointOfInterestWithId: aString [ 
	
	^ pointsOfInterest keys detect: [ :e | e name = aString ]
]

{ #category : 'accessing' }
XCThreadProfiler >> pointsOfInterest [

	^ pointsOfInterest keys copyWithout: unclassified
]

{ #category : 'accessing' }
XCThreadProfiler >> samplesForPoi: aPoi [ 
	
	^ pointsOfInterest at: aPoi
]

{ #category : 'accessing' }
XCThreadProfiler >> totalSamples [
	
	^ pointsOfInterest sum: [ :e | e size ]
]

{ #category : 'as yet unclassified' }
XCThreadProfiler >> totalTimes [

	^ pointsOfInterest collect: [ :samples | samples size ]
]

Class {
	#name : #XCCompositePointOfInterest,
	#superclass : #Object,
	#instVars : [
		'name',
		'pointsOfInterest'
	],
	#category : #XCTrace
}

{ #category : #'instance creation' }
XCCompositePointOfInterest class >> named: aName [

	^ self new
		  name: aName;
		  yourself
]

{ #category : #testing }
XCCompositePointOfInterest >> addPointOfInterest: aPointOfInterest [

	pointsOfInterest add: aPointOfInterest
]

{ #category : #testing }
XCCompositePointOfInterest >> addPointOfInterestForFunctionNamed: aString [

	self addPointOfInterest:
		(XCFunctionCallPointOfInterest named: aString)
]

{ #category : #testing }
XCCompositePointOfInterest >> initialize [

	super initialize.
	pointsOfInterest := Set new
]

{ #category : #accessing }
XCCompositePointOfInterest >> name [

	^ name
]

{ #category : #accessing }
XCCompositePointOfInterest >> name: anObject [

	name := anObject
]

{ #category : #printing }
XCCompositePointOfInterest >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	aStream print: name.
	aStream nextPut: $)
]

{ #category : #testing }
XCCompositePointOfInterest >> wantsFrame: aXMLElement index: anInteger frames: frames [

	^ pointsOfInterest anySatisfy: [ :poi |
		  poi wantsFrame: aXMLElement index: anInteger frames: frames ]
]

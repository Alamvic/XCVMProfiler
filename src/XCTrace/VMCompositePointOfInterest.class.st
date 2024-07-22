Class {
	#name : 'VMCompositePointOfInterest',
	#superclass : 'VMPointOfInterestAbstract',
	#instVars : [
		'name',
		'pointsOfInterest'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'instance creation' }
VMCompositePointOfInterest class >> named: aName [

	^ self new
		  name: aName;
		  yourself
]

{ #category : 'testing' }
VMCompositePointOfInterest >> addPointOfInterest: aPointOfInterest [

	pointsOfInterest add: aPointOfInterest
]

{ #category : 'testing' }
VMCompositePointOfInterest >> addPointOfInterestForFunctionNamed: aString [

	self addPointOfInterest:
		(VMFunctionCallPointOfInterest named: aString)
]

{ #category : 'accessing' }
VMCompositePointOfInterest >> name [

	^ name
]

{ #category : 'accessing' }
VMCompositePointOfInterest >> name: anObject [

	name := anObject
]

{ #category : 'printing' }
VMCompositePointOfInterest >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	aStream print: name.
	aStream nextPut: $)
]

{ #category : 'accessing' }
VMCompositePointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ pointsOfInterest anySatisfy: [ :poi |
		  poi wantsFrame: aNameOfElement index: anInteger frames: frames ]
]

Class {
	#name : #XCUnclassifiedPointOfInterest,
	#superclass : #Object,
	#category : #XCTrace
}

{ #category : #accessing }
XCUnclassifiedPointOfInterest >> name [
	
	^ 'Others'
]

{ #category : #testing }
XCUnclassifiedPointOfInterest >> wantsFrame: aXMLElement index: anInteger frames: frames [ 
	self shouldBeImplemented.
]

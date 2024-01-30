Class {
	#name : #XCMCPointOfInterest,
	#superclass : #Object,
	#category : #XCTrace
}

{ #category : #accessing }
XCMCPointOfInterest >> name [
	
	^ 'Machine Code'
]

{ #category : #testing }
XCMCPointOfInterest >> wantsFrame: aXMLElement index: anInteger frames: frames [

	^ (aXMLElement attributeAt: 'name') beginsWith: '0x'
]

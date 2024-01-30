Class {
	#name : #XCTrampolinePointOfInterest,
	#superclass : #Object,
	#category : #XCTrace
}

{ #category : #accessing }
XCTrampolinePointOfInterest >> name [
	
	^ 'Trampolines'
]

{ #category : #testing }
XCTrampolinePointOfInterest >> wantsFrame: aXMLElement index: anInteger frames: frames [

	| name |
	name := aXMLElement attributeAt: 'name'.
	^ (name beginsWith: 'ce') and: [ (name at: 3) isUppercase ]
]

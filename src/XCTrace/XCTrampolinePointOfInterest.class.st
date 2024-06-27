Class {
	#name : 'XCTrampolinePointOfInterest',
	#superclass : 'XCPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCTrampolinePointOfInterest >> name [
	
	^ 'Trampolines'
]

{ #category : 'accessing' }
XCTrampolinePointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ (aNameOfElement beginsWith: 'ce') and: [
		  (aNameOfElement at: 3) isUppercase ]
]

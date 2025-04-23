Class {
	#name : 'VMTrampolinePointOfInterest',
	#superclass : 'VMPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMTrampolinePointOfInterest >> name [
	
	^ 'Trampolines'
]

{ #category : 'accessing' }
VMTrampolinePointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ (aNameOfElement beginsWith: 'ce') and: [
		  aNameOfElement third isUppercase ]
]

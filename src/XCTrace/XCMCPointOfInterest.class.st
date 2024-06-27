Class {
	#name : 'XCMCPointOfInterest',
	#superclass : 'XCPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCMCPointOfInterest >> name [
	
	^ 'Machine Code'
]

{ #category : 'accessing' }
XCMCPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ aNameOfElement beginsWith: '0x'
]

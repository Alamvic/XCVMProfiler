Class {
	#name : 'VMMCPointOfInterest',
	#superclass : 'VMPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMMCPointOfInterest >> name [
	
	^ 'Machine Code'
]

{ #category : 'accessing' }
VMMCPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ aNameOfElement beginsWith: '0x'
]

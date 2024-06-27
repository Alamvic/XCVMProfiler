Class {
	#name : 'XCPointOfInterestAbstract',
	#superclass : 'Object',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCPointOfInterestAbstract >> name [

	self subclassResponsibility
]

{ #category : 'accessing' }
XCPointOfInterestAbstract >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	self subclassResponsibility
]

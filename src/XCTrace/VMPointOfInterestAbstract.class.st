Class {
	#name : 'VMPointOfInterestAbstract',
	#superclass : 'Object',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMPointOfInterestAbstract >> name [

	self subclassResponsibility
]

{ #category : 'accessing' }
VMPointOfInterestAbstract >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	self subclassResponsibility
]

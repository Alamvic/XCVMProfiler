Class {
	#name : 'XCUnclassifiedPointOfInterest',
	#superclass : 'XCPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCUnclassifiedPointOfInterest >> name [
	
	^ 'Others'
]

{ #category : 'accessing' }
XCUnclassifiedPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ (XCPointOfInterestAbstract subclasses select: [ :subclass |
		   subclass ~= self class and: [
			   subclass new
				   wantsFrame: aNameOfElement
				   index: anInteger
				   frames: frames ] ]) isEmpty
]

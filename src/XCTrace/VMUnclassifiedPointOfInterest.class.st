Class {
	#name : 'VMUnclassifiedPointOfInterest',
	#superclass : 'VMPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMUnclassifiedPointOfInterest >> name [
	
	^ 'Others'
]

{ #category : 'accessing' }
VMUnclassifiedPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ false "(XCPointOfInterestAbstract subclasses select: [ :subclass |
		   subclass ~= self class and: [
			   subclass new
				   wantsFrame: aNameOfElement
				   index: anInteger
				   frames: frames ] ]) isEmpty"
]

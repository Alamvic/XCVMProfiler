Class {
	#name : 'XCPrimitiveFromInterpreterPointOfInterest',
	#superclass : 'XCPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCPrimitiveFromInterpreterPointOfInterest >> name [
	
	^ 'Interpreter -> Primitive'
]

{ #category : 'accessing' }
XCPrimitiveFromInterpreterPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ (aNameOfElement beginsWith: 'primitive') and: [
		  | callerName |
		  callerName := frames at: anInteger + 1.
		  ((callerName beginsWith: '0x') or: [
			   (callerName beginsWith: 'ce') and: callerName third isUppercase ])
			  not ]
]

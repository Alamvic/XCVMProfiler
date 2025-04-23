Class {
	#name : 'VMPrimitiveFromInterpreterPointOfInterest',
	#superclass : 'VMPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMPrimitiveFromInterpreterPointOfInterest >> name [
	
	^ 'Interpreter -> Primitive'
]

{ #category : 'accessing' }
VMPrimitiveFromInterpreterPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ (aNameOfElement beginsWith: 'primitive') "and: [
		  | callerName |
		  callerName := frames at: anInteger + 1.
		  ((callerName beginsWith: '0x') or: [
			   (callerName beginsWith: 'ce') and: [callerName third isUppercase] ])
			  not ]"
]

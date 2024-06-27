Class {
	#name : 'XCPrimitiveFromMCPointOfInterest',
	#superclass : 'XCPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCPrimitiveFromMCPointOfInterest >> name [
	
	^ 'MC -> Primitive'
]

{ #category : 'accessing' }
XCPrimitiveFromMCPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ (aNameOfElement beginsWith: 'primitive') and: [
		  | callerName |
		  callerName := frames at: anInteger + 1.
		  (callerName beginsWith: '0x') or: [
			  ((callerName beginsWith: 'ce') and: [
				   callerName third isUppercase ]) or: [
				  callerName = 'interpretMethodFromMachineCode' ] ] ]
]

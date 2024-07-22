Class {
	#name : 'VMPrimitiveFromMCPointOfInterest',
	#superclass : 'VMPointOfInterestAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMPrimitiveFromMCPointOfInterest >> name [
	
	^ 'MC -> Primitive'
]

{ #category : 'accessing' }
VMPrimitiveFromMCPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ (aNameOfElement beginsWith: 'primitive') "and: [
		  | callerName |
		  callerName := frames at: anInteger + 1.
		  (callerName beginsWith: '0x') or: [
			  ((callerName beginsWith: 'ce') and: [
				   callerName third isUppercase ]) or: [
				  callerName = 'interpretMethodFromMachineCode' ] ] ]"
]

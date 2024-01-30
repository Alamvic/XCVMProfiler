Class {
	#name : #XCPrimitiveFromMCPointOfInterest,
	#superclass : #Object,
	#category : #XCTrace
}

{ #category : #accessing }
XCPrimitiveFromMCPointOfInterest >> name [
	
	^ 'MC -> Primitive'
]

{ #category : #testing }
XCPrimitiveFromMCPointOfInterest >> wantsFrame: aXMLElement index: anInteger frames: frames [

	^ ((aXMLElement attributeAt: 'name') beginsWith: 'primitive') and: [
		  | callerName |
		  callerName := (frames at: anInteger + 1) attributeAt: 'name'.
		  (callerName beginsWith: '0x') or: [
			  ((callerName beginsWith: 'ce') and: [
				   callerName third isUppercase ]) or: [
				  callerName = 'interpretMethodFromMachineCode' ] ] ]
]

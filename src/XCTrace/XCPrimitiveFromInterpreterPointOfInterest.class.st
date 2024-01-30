Class {
	#name : #XCPrimitiveFromInterpreterPointOfInterest,
	#superclass : #Object,
	#category : #XCTrace
}

{ #category : #accessing }
XCPrimitiveFromInterpreterPointOfInterest >> name [
	
	^ 'Interpreter -> Primitive'
]

{ #category : #testing }
XCPrimitiveFromInterpreterPointOfInterest >> wantsFrame: aXMLElement index: anInteger frames: frames [

	^ ((aXMLElement attributeAt: 'name') beginsWith: 'primitive') and: [
		  | callerName |
		  callerName := (frames at: anInteger + 1) attributeAt: 'name'.
		  ((callerName beginsWith: '0x') or: [
			   (callerName beginsWith: 'ce') and: callerName third isUppercase ])
			  not ]
]

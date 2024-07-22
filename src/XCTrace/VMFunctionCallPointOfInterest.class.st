Class {
	#name : 'VMFunctionCallPointOfInterest',
	#superclass : 'VMPointOfInterestAbstract',
	#instVars : [
		'functionName'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'instance creation' }
VMFunctionCallPointOfInterest class >> named: aName [

	^ self new
		  functionName: aName;
		  yourself
]

{ #category : 'accessing' }
VMFunctionCallPointOfInterest >> functionName [

	^ functionName
]

{ #category : 'accessing' }
VMFunctionCallPointOfInterest >> functionName: anObject [

	functionName := anObject
]

{ #category : 'accessing' }
VMFunctionCallPointOfInterest >> name [
	
	^ functionName
]

{ #category : 'printing' }
VMFunctionCallPointOfInterest >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	aStream print: functionName.
	aStream nextPut: $)
]

{ #category : 'accessing' }
VMFunctionCallPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ functionName = aNameOfElement
]

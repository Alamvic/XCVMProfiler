Class {
	#name : 'XCFunctionCallPointOfInterest',
	#superclass : 'XCPointOfInterestAbstract',
	#instVars : [
		'functionName'
	],
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'instance creation' }
XCFunctionCallPointOfInterest class >> named: aName [

	^ self new
		  functionName: aName;
		  yourself
]

{ #category : 'accessing' }
XCFunctionCallPointOfInterest >> functionName [

	^ functionName
]

{ #category : 'accessing' }
XCFunctionCallPointOfInterest >> functionName: anObject [

	functionName := anObject
]

{ #category : 'accessing' }
XCFunctionCallPointOfInterest >> name [
	
	^ functionName
]

{ #category : 'printing' }
XCFunctionCallPointOfInterest >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	aStream print: functionName.
	aStream nextPut: $)
]

{ #category : 'accessing' }
XCFunctionCallPointOfInterest >> wantsFrame: aNameOfElement index: anInteger frames: frames [

	^ functionName = aNameOfElement
]

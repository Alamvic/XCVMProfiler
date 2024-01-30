Class {
	#name : #XCFunctionCallPointOfInterest,
	#superclass : #Object,
	#instVars : [
		'functionName'
	],
	#category : #XCTrace
}

{ #category : #'instance creation' }
XCFunctionCallPointOfInterest class >> named: aName [

	^ self new
		  functionName: aName;
		  yourself
]

{ #category : #accessing }
XCFunctionCallPointOfInterest >> functionName [

	^ functionName
]

{ #category : #accessing }
XCFunctionCallPointOfInterest >> functionName: anObject [

	functionName := anObject
]

{ #category : #accessing }
XCFunctionCallPointOfInterest >> name [
	
	^ functionName
]

{ #category : #printing }
XCFunctionCallPointOfInterest >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	aStream print: functionName.
	aStream nextPut: $)
]

{ #category : #testing }
XCFunctionCallPointOfInterest >> wantsFrame: aXMLElement index: anInteger frames: frames [

	^ functionName = (aXMLElement attributeAt: 'name')
]

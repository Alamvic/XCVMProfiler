Class {
	#name : #TreeParser,
	#superclass : #Object,
	#instVars : [
		'content',
		'time'
	],
	#category : #TreeParser
}

{ #category : #'instance creation' }
TreeParser class >> fromFile: aFile [

	^ self new content: aFile asFileReference
]

{ #category : #accessing }
TreeParser >> asNodes [

	^ TreeNodes new nodes: content
]

{ #category : #accessing }
TreeParser >> content [
	
	^ content
]

{ #category : #accessing }
TreeParser >> content: aFile [

	| timeFromFile fileContents |
	fileContents := aFile contents.
	
	timeFromFile := (fileContents lines at: 24) asInteger.
	time := timeFromFile asFloat.
	
	content := fileContents lines reject: [ :line | line beginsWith: '#' ]
]

{ #category : #accessing }
TreeParser >> readLine: pos [

	^ content at: pos
]

{ #category : #accessing }
TreeParser >> time [
	
	^ time
]

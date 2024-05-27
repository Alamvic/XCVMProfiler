Class {
	#name : #TreeParse,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #TreeParser
}

{ #category : #'instance creation' }
TreeParse class >> fromFile: aFile [
	self assert: aFile class = FileReference.
	^ self new
		content: aFile.
]

{ #category : #accessing }
TreeParse >> asNodes [

	^ TreeNodes new nodes: content
]

{ #category : #accessing }
TreeParse >> content: aFile [

	content := aFile contents lines reject: [ :line |
		           line beginsWith: '#' ]
]

{ #category : #accessing }
TreeParse >> readLine: pos [

	^ content at: pos
]

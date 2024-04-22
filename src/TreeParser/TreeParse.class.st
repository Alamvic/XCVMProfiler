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

{ #category : #'as yet unclassified' }
TreeParse >> asNodes [

	^ TreeNodes new
		nodes: content.
]

{ #category : #'as yet unclassified' }
TreeParse >> content: aFile [
	content := (aFile contents) lines reject: [:line | line beginsWith: '#'].
]

{ #category : #'as yet unclassified' }
TreeParse >> readLine: pos [
	^ content at: pos.
]

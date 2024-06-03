Class {
	#name : #TreeTrace,
	#superclass : #Object,
	#instVars : [
		'name',
		'weight'
	],
	#category : #TreeParser
}

{ #category : #accessing }
TreeTrace >> name [

	^ name
]

{ #category : #accessing }
TreeTrace >> name: aName [

	name := aName
]

{ #category : #accessing }
TreeTrace >> weight [

	^ weight
]

{ #category : #accessing }
TreeTrace >> weight: aFloat [

	weight := aFloat
]

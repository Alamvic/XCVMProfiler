Class {
	#name : #PerfTreeTrace,
	#superclass : #Object,
	#instVars : [
		'name',
		'weight'
	],
	#category : #PerfTreeParser
}

{ #category : #accessing }
PerfTreeTrace >> name [

	^ name
]

{ #category : #accessing }
PerfTreeTrace >> name: aName [

	name := aName
]

{ #category : #accessing }
PerfTreeTrace >> weight [

	^ weight
]

{ #category : #accessing }
PerfTreeTrace >> weight: aFloat [

	weight := aFloat
]

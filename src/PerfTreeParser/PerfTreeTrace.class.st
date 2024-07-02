Class {
	#name : 'PerfTreeTrace',
	#superclass : 'Object',
	#instVars : [
		'name',
		'time',
		'rawPercentage'
	],
	#category : 'PerfTreeParser',
	#package : 'PerfTreeParser'
}

{ #category : 'accessing' }
PerfTreeTrace >> name [

	^ name
]

{ #category : 'accessing' }
PerfTreeTrace >> name: aName [

	name := aName
]

{ #category : 'accessing' }
PerfTreeTrace >> rawPercentage [

	^ rawPercentage
]

{ #category : 'accessing' }
PerfTreeTrace >> rawPercentage: anObject [

	rawPercentage := anObject
]

{ #category : 'accessing' }
PerfTreeTrace >> time [

	^ time
]

{ #category : 'accessing' }
PerfTreeTrace >> time: anObject [

	time := anObject
]

Class {
	#name : 'VMBenchGetter',
	#superclass : 'Object',
	#instVars : [
		'originalContent',
		'timeStamp'
	],
	#category : 'VMBenchSQL',
	#package : 'VMBenchSQL'
}

{ #category : 'instance creation' }
VMBenchGetter class >> fromContent: aTableContent [

	^ self new
		originalContent: aTableContent;
		timeStamp: Date today yyyymmdd;
		yourself
]

{ #category : 'accessing' }
VMBenchGetter >> exportToSQLDatabase [
]

{ #category : 'accessing' }
VMBenchGetter >> originalContent [

	^ originalContent
]

{ #category : 'accessing' }
VMBenchGetter >> originalContent: anObject [

	originalContent := anObject
]

{ #category : 'accessing' }
VMBenchGetter >> structuredContent [

	| subs newSubs dictContent j |
	subs := originalContent substrings.
	newSubs := OrderedCollection new.
	newSubs add: subs first.
	j := 1.

	2 to: subs size do: [ :i |
		(subs at: i) first asString isAllDigits not
			ifTrue: [
				newSubs at: j put: ((newSubs at: j)
						 ifEmpty: [ (newSubs at: j) , (subs at: i) ]
						 ifNotEmpty: [ (newSubs at: j) , ' ' , (subs at: i) ]) ]
			ifFalse: [
				newSubs add: (subs at: i).
				i ~= subs size ifTrue: [ newSubs add: '' ].
				j := j + 2 ] ].

	dictContent := Dictionary new.
	1 to: newSubs size by: 2 do: [ :i |
		dictContent at: (newSubs at: i) put: (newSubs at: i + 1) asNumber ].

	^ dictContent
]

{ #category : 'accessing' }
VMBenchGetter >> timeStamp [

	^ timeStamp
]

{ #category : 'accessing' }
VMBenchGetter >> timeStamp: anObject [

	timeStamp := anObject
]

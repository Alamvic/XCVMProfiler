Class {
	#name : 'VMBenchSQLExporter',
	#superclass : 'Object',
	#instVars : [
		'content',
		'client'
	],
	#category : 'VMBenchSQL',
	#package : 'VMBenchSQL'
}

{ #category : 'as yet unclassified' }
VMBenchSQLExporter >> client [

	^ client
]

{ #category : 'as yet unclassified' }
VMBenchSQLExporter >> clientWithUserName: aUserName [

	client := P3Client new url: 'psql://' , aUserName , '@localhost'.

	^ client
]

{ #category : 'accessing' }
VMBenchSQLExporter >> content [

	^ content
]

{ #category : 'accessing' }
VMBenchSQLExporter >> content: anObject [

	content := anObject
]

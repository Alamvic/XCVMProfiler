Class {
	#name : 'VMBenchSQLExporter',
	#superclass : 'Object',
	#instVars : [
		'content',
		'client',
		'tableName',
		'timeStamp'
	],
	#category : 'VMBenchSQL',
	#package : 'VMBenchSQL'
}

{ #category : 'instance creation' }
VMBenchSQLExporter class >> fromContent: aStructuredContent WithUser: aUserName TableName: aTableName andTimeStamp: aTimeStamp [

	^ self new
		content: aStructuredContent;
		clientWithUserName: aUserName;
		tableName: aTableName;
		timeStamp: aTimeStamp;
		yourself
]

{ #category : 'accessing' }
VMBenchSQLExporter >> client [

	^ client
]

{ #category : 'accessing' }
VMBenchSQLExporter >> client: aClient [

	client := aClient
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
VMBenchSQLExporter >> data [

	^ (client query: 'SELECT * FROM ' , tableName) data
]

{ #category : 'accessing' }
VMBenchSQLExporter >> export [

	| newBenchId newId |
	client execute: 'CREATE TABLE IF NOT EXISTS ' , tableName
		,
		' (id int, bench_id int, timestamp date, profile varchar(30), value real);'.

	newId := self newId.
	newBenchId := self newBenchId.

	content keysDo: [ :key |
		client execute:
			'INSERT INTO ' , tableName , ' VALUES (' , newId asString , ', '
			, newBenchId asString , ', ''' , timeStamp , ''' , '''
			, key asString , ''' ,' , (content at: key) asString , ');'.
		newId := newId + 1 ].

	^ self data
]

{ #category : 'accessing' }
VMBenchSQLExporter >> lastBenchId [

	| lastData |
	self data
		ifNotEmpty: [
			lastData := self data last.

			^ lastData second ]
		ifEmpty: [ ^ 0 ]
]

{ #category : 'accessing' }
VMBenchSQLExporter >> lastId [

	| lastData |
	self data
		ifNotEmpty: [
			lastData := self data last.

			^ lastData first ]
		ifEmpty: [ ^ 0 ]
]

{ #category : 'accessing' }
VMBenchSQLExporter >> newBenchId [

	^ self lastBenchId + 1
]

{ #category : 'accessing' }
VMBenchSQLExporter >> newId [

	^ self lastId + 1
]

{ #category : 'accessing' }
VMBenchSQLExporter >> tableName [

	^ tableName
]

{ #category : 'accessing' }
VMBenchSQLExporter >> tableName: aTableName [

	tableName := aTableName
]

{ #category : 'accessing' }
VMBenchSQLExporter >> timeStamp [

	^ timeStamp
]

{ #category : 'accessing' }
VMBenchSQLExporter >> timeStamp: anObject [

	timeStamp := anObject
]

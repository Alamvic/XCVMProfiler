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

{ #category : 'accessing' }
VMBenchSQLExporter >> export [

	| lastData lastBenchId lastId newBenchId newId |
	client execute: 'CREATE TABLE IF NOT EXISTS ' , tableName
		,
		' (id int, bench_id int, timestamp date, profile varchar(30), value real);'.

	lastData := (client query: 'SELECT * FROM ' , tableName) data last.

	lastBenchId := lastData second.
	newBenchId := lastBenchId + 1.

	lastId := lastData first.
	newId := lastId + 1.

	content keysDo: [ :key |
		client execute:
			('INSERT INTO ' , tableName , ' VALUES (' , newId asString , ', '
			, newBenchId asString , ', ''' , timeStamp , ''' , ''' , key asString , ''' ,'
			, (content at: key) asString , ');').
		newId := newId + 1 ].

	^ (client query: 'SELECT * FROM ' , tableName) data
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

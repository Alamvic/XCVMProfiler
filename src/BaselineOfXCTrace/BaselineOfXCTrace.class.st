Class {
	#name : #BaselineOfXCTrace,
	#superclass : #BaselineOf,
	#category : #BaselineOfXCTrace
}

{ #category : #packages }
BaselineOfXCTrace >> XMLParser: spec [
	spec
		baseline: 'XMLParser'
		with: [ spec repository: 'github://pharo-contributions/XML-XMLParser' ]
		
]

{ #category : #baselines }
BaselineOfXCTrace >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"Dependencies"
		self XMLParser: spec.
		
		"Packages"
		spec 
			package: #XCTrace with: [spec requires: #XMLParser];
			package: 'XCTrace-Tests' with: [spec requires: #XCTrace] ]
]

{ #category : #accessing }
BaselineOfXCTrace >> projectClass [
	^ MetacelloCypressBaselineProject
]

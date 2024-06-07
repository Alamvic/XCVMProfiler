Class {
	#name : #BaselineOfPerfTreeParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfPerfTreeParser
}

{ #category : #baselines }
BaselineOfPerfTreeParser >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"Packages"
		spec 
			package: #PerfTreeParser;
			package: 'PerfTreeParser-Tests' with: [ spec requires: #PerfTreeParser ] ]
]

{ #category : #accessing }
BaselineOfPerfTreeParser >> projectClass [
	^ MetacelloCypressBaselineProject
]

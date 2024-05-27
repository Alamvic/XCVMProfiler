Class {
	#name : #BaselineOfTreeParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfTreeParser
}

{ #category : #baselines }
BaselineOfTreeParser >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"Packages"
		spec 
			package: #TreeParser;
			package: 'TreeParser-Tests' with: [ spec requires: #TreeParser ] ]
]

{ #category : #accessing }
BaselineOfTreeParser >> projectClass [
	^ MetacelloCypressBaselineProject
]

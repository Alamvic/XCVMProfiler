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
			package: #TreeParser ]
]

{ #category : #accessing }
BaselineOfTreeParser >> projectClass [
	^ MetacelloCypressBaselineProject
]

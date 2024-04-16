Class {
	#name : #BaselineOfXCTrace,
	#superclass : #Object,
	#category : #BaselineOfXCTrace
}

{ #category : #baselines }
BaselineOfXCTrace >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: #XCTrace  ]
]

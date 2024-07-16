Class {
	#name : 'BaselineOfVMBenchSQL',
	#superclass : 'Object',
	#category : 'BaselineOfVMBenchSQL',
	#package : 'BaselineOfVMBenchSQL'
}

{ #category : 'packages' }
BaselineOfVMBenchSQL >> P3: spec [
	spec
		baseline: 'P3'
		with: [ spec repository: 'github://svenvc/P3' ]
		
]

{ #category : 'baselines' }
BaselineOfVMBenchSQL >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"Dependencies"
		self P3: spec.
		
		"Packages"
		spec 
			package: #VMBenchSQL with: [spec requires: #P3];
			package: 'VMBenchSQL-Tests' with: [spec requires: #VMBenchSQL] ]
]

{ #category : 'accessing' }
BaselineOfVMBenchSQL >> projectClass [

	^ MetacelloCypressBaselineProject
]

Class {
	#name : 'XCVMDifferentialProfiler',
	#superclass : 'XCVMDifferentialProfilerAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCVMDifferentialProfiler >> table [

	^ (String crlf join:
		   (#( 'Machine Code' Trampolines 'MC -> Primitive'
		       compilation interpret 'Interpreter -> Primitive' ) collect: [
			    :concern |
			    concern , String tab
			    , (String tab join: (self profiles collect: [ :e |
						      ((e value threads at: (e value threads keys second)) totalTimes associations
							       detect: [ :a | a key name = concern ]) value ])) ]))
	  , String crlf , String crlf , String crlf
	  , (String tab join: (self profiles collect: [ :p |
				    (p value threads at: (p value threads keys second)) totalSamples asString ]))
]

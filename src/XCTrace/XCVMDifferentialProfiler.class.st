Class {
	#name : 'XCVMDifferentialProfiler',
	#superclass : 'XCVMDifferentialProfilerAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
XCVMDifferentialProfiler >> table [

	| theKeys theValues |
	^ (String crlf join:
		   (#( 'Machine Code' Trampolines 'MC -> Primitive'
		       compilation interpret 'Interpreter -> Primitive' Others ) collect: [
			    :concern |
			    concern , String tab
			    , (String tab join: (self profiles collect: [ :e |
						      theKeys := e threads keys select: [ :key |
							                 key isNotEmpty and: [
								                 ((e threads at: key) pointsOfInterest keys
									                  select: [ :n | ((e threads at: key) pointsOfInterest at: n) isNotEmpty ]) first name = concern ] ].
						      theValues := theKeys collect: [ :aKey |
							                   (e threads at: aKey) pointsOfInterest values
								                   select: [ :v | v isNotEmpty ] ].
						      theValues size ])) ])) , String crlf ", String crlf
	  , String crlf , (String tab join: (self profiles collect: [ :p |
			    p threads keys collect: [ :key |
				    (p value threads at: key) totalSamples asString ] ]))"
]

Class {
	#name : 'VMDifferentialProfiler',
	#superclass : 'VMDifferentialProfilerAbstract',
	#category : 'XCTrace',
	#package : 'XCTrace'
}

{ #category : 'accessing' }
VMDifferentialProfiler >> table [

	| theKeys theValues profilesNames categoryTime finalTime |
	profilesNames := #( 'Machine Code' Trampolines 'MC -> Primitive'
	                    compilation interpret 'Interpreter -> Primitive' ).
	finalTime := 0 asFloat.

	^ (String crlf join: (profilesNames collect: [ :concern |
			    concern , String tab
			    , (String tab join: (self profiles collect: [ :e |
						      theKeys := e threads keys select: [ :key |
							                 key isNotEmpty and: [
								                 ((e threads at: key) pointsOfInterest keys
									                  select: [ :n |
									                  ((e threads at: key) pointsOfInterest at: n)
										                  isNotEmpty ]) first name = concern ] ].
						      theValues := theKeys collect: [ :aKey |
							                   (e threads at: aKey) pointsOfInterest values
								                   select: [ :v | v isNotEmpty ] ].
						      theValues := theValues collect: [ :val | val first first ].

						      categoryTime := theValues sum: [ :val |
							                      val sumOfTime ].

						      finalTime := finalTime + categoryTime.
						      categoryTime ])) ])) , String crlf , String crlf
	  , String crlf , 'Total' , String tab , finalTime asString
]

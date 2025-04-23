Class {
	#name : 'XCTraceTest',
	#superclass : 'TestCase',
	#instVars : [
		'memoryFS',
		'fr',
		'tree',
		'treeSamples',
		'frEmpty',
		'treeEmpty'
	],
	#category : 'XCTrace-Tests',
	#package : 'XCTrace-Tests'
}

{ #category : 'running' }
XCTraceTest >> setUp [
	super setUp.
	memoryFS := FileSystem memory.
	
	memoryFS / ('test-profile.trace') writeStreamDo: [:strm | strm nextPutAll: '<?xml version="1.0"?>
<trace-query-result>
<node xpath=''//trace-toc[1]/run[13]/data[1]/table[13]''><schema name="time-profile"><col><mnemonic>time</mnemonic><name>Sample Time</name><engineering-type>sample-time</engineering-type></col><col><mnemonic>thread</mnemonic><name>Thread</name><engineering-type>thread</engineering-type></col><col><mnemonic>process</mnemonic><name>Process</name><engineering-type>process</engineering-type></col><col><mnemonic>core</mnemonic><name>Core</name><engineering-type>core</engineering-type></col><col><mnemonic>thread-state</mnemonic><name>State</name><engineering-type>thread-state</engineering-type></col><col><mnemonic>weight</mnemonic><name>Weight</name><engineering-type>weight</engineering-type></col><col><mnemonic>stack</mnemonic><name>Backtrace</name><engineering-type>backtrace</engineering-type></col></schema><row><sample-time id="1" fmt="00:00.383.060">383060916</sample-time><thread id="2" fmt="Main Thread  0x171eff (Pharo, pid: 86036)"><tid id="3" fmt="0x171eff">1515263</tid><process id="4" fmt="Pharo (86036)"><pid id="5" fmt="86036">86036</pid><device-session id="6" fmt="TODO">TODO</device-session></process></thread><process ref="4"/><core id="7" fmt="CPU 0 (E Core)">0</core><thread-state id="8" fmt="Running">Running</thread-state><weight id="9" fmt="1.00 ms">1000000</weight><backtrace id="10"><frame id="11" name="fsgetpath" addr="0x182876f91"><binary id="12" name="dyld" UUID="50746901-DB0E-39A0-B391-BAAA6B82AD0F" arch="arm64e" load-addr="0x1827ff000" path="/usr/lib/dyld"/></frame><frame id="13" name="0x1828087f8" addr="0x1828087f8"><binary ref="12"/></frame><frame id="14" name="dyld4::ProcessConfig::Process::Process(dyld4::KernelArgs const*, dyld4::SyscallDelegate&amp;, lsl::Allocator&amp;)" addr="0x182808260"><binary ref="12"/></frame><frame id="15" name="dyld4::ProcessConfig::ProcessConfig(dyld4::KernelArgs const*, dyld4::SyscallDelegate&amp;, lsl::Allocator&amp;)" addr="0x1828076d4"><binary ref="12"/></frame><frame id="16" name="start" addr="0x182804da8"><binary ref="12"/></frame></backtrace></row>
<row><sample-time id="17" fmt="00:00.384.060">384060375</sample-time><thread ref="2"/><process ref="4"/><core ref="7"/><thread-state ref="8"/><weight ref="9"/><backtrace id="18"><frame id="19" name="0x18280c0f1" addr="0x18280c0f1"><binary ref="12"/></frame><frame id="20" name="0x18280c0bc" addr="0x18280c0bc"><binary ref="12"/></frame><frame id="21" name="0x18280bf4c" addr="0x18280bf4c"><binary ref="12"/></frame><frame id="22" name="0x18280be58" addr="0x18280be58"><binary ref="12"/></frame><frame id="23" name="0x18280bf9c" addr="0x18280bf9c"><binary ref="12"/></frame><frame id="24" name="invocation function for block in dyld4::Loader::getLoader(Diagnostics&amp;, dyld4::RuntimeState&amp;, char const*, dyld4::Loader::LoadOptions const&amp;)" addr="0x18281b1d8"><binary ref="12"/></frame><frame id="25" name="dyld4::Loader::forEachResolvedAtPathVar(dyld4::RuntimeState&amp;, char const*, dyld4::Loader::LoadOptions const&amp;, dyld4::ProcessConfig::PathOverrides::Type, bool&amp;, void (char const*, dyld4::ProcessConfig::PathOverrides::Type, bool&amp;) block_pointer)" addr="0x18281a694"><binary ref="12"/></frame><frame id="26" name="dyld4::ProcessConfig::PathOverrides::forEachPathVariant(char const*, dyld3::Platform, bool, bool, bool&amp;, void (char const*, dyld4::ProcessConfig::PathOverrides::Type, bool&amp;) block_pointer) const" addr="0x182807e24"><binary ref="12"/></frame><frame id="27" name="dyld4::Loader::forEachPath(Diagnostics&amp;, dyld4::RuntimeState&amp;, char const*, dyld4::Loader::LoadOptions const&amp;, void (char const*, dyld4::ProcessConfig::PathOverrides::Type, bool&amp;) block_pointer)" addr="0x18281a1cc"><binary ref="12"/></frame><frame id="28" name="dyld4::Loader::getLoader(Diagnostics&amp;, dyld4::RuntimeState&amp;, char const*, dyld4::Loader::LoadOptions const&amp;)" addr="0x18281a9fc"><binary ref="12"/></frame><frame id="29" name="invocation function for block in dyld4::JustInTimeLoader::loadDependents(Diagnostics&amp;, dyld4::RuntimeState&amp;, dyld4::Loader::LoadOptions const&amp;)" addr="0x182822f2c"><binary ref="12"/></frame><frame id="30" name="invocation function for block in dyld3::MachOFile::forEachDependentDylib(void (char const*, bool, bool, bool, unsigned int, unsigned int, bool&amp;) block_pointer) const" addr="0x182859cd0"><binary ref="12"/></frame><frame id="31" name="dyld3::MachOFile::forEachLoadCommand(Diagnostics&amp;, void (load_command const*, bool&amp;) block_pointer) const" addr="0x1828012fc"><binary ref="12"/></frame><frame id="32" name="dyld3::MachOFile::forEachDependentDylib(void (char const*, bool, bool, bool, unsigned int, unsigned int, bool&amp;) block_pointer) const" addr="0x182859b04"><binary ref="12"/></frame><frame id="33" name="dyld4::JustInTimeLoader::loadDependents(Diagnostics&amp;, dyld4::RuntimeState&amp;, dyld4::Loader::LoadOptions const&amp;)" addr="0x182822c70"><binary ref="12"/></frame><frame id="34" name="dyld4::JustInTimeLoader::loadDependents(Diagnostics&amp;, dyld4::RuntimeState&amp;, dyld4::Loader::LoadOptions const&amp;)" addr="0x182822cfc"><binary ref="12"/></frame><frame id="35" name="dyld4::prepare(dyld4::APIs&amp;, dyld3::MachOAnalyzer const*)" addr="0x1828057c0"><binary ref="12"/></frame><frame id="36" name="start" addr="0x182804edc"><binary ref="12"/></frame></backtrace></row>
</node></trace-query-result>
'].

	memoryFS / ('test-empty-profile.trace') writeStreamDo: [:stream | stream nextPutAll: '<?xml version="1.0"?>
<trace-query-result>
<node xpath=''//trace-toc[1]/run[13]/data[1]/table[13]''><schema name="time-profile"><col><mnemonic>time</mnemonic><name>Sample Time</name><engineering-type>sample-time</engineering-type></col><col><mnemonic>thread</mnemonic><name>Thread</name><engineering-type>thread</engineering-type></col><col><mnemonic>process</mnemonic><name>Process</name><engineering-type>process</engineering-type></col><col><mnemonic>core</mnemonic><name>Core</name><engineering-type>core</engineering-type></col><col><mnemonic>thread-state</mnemonic><name>State</name><engineering-type>thread-state</engineering-type></col><col><mnemonic>weight</mnemonic><name>Weight</name><engineering-type>weight</engineering-type></col><col><mnemonic>stack</mnemonic><name>Backtrace</name><engineering-type>backtrace</engineering-type></col></schema>
</node> </trace-query-result>
'].

	fr := memoryFS / ('test-profile.trace').
	tree := XCTraceTree fromTimeProfileFileReference: fr.
	treeSamples := tree samples.

	frEmpty := memoryFS / ('test-empty-profile.trace').
	treeEmpty := XCTraceTree fromTimeProfileFileReference: frEmpty.

]

{ #category : 'running' }
XCTraceTest >> tearDown [ 

	fr ensureDelete.
	frEmpty ensureDelete.
	super tearDown.
]

{ #category : 'tests' }
XCTraceTest >> testContentOfProfiler [
	"Needs a rework."

	| profiler |
	profiler := VMProfiler new
		            addPointOfInterest: VMMCPointOfInterest new;
		            classify: treeSamples.
	self
		assert:
		(profiler threads keys select: [ :key | key isNotEmpty ]) size
		equals: 1
]

{ #category : 'tests' }
XCTraceTest >> testFrameIsNotEmpty [
	self assert: (treeSamples first stackTrace frames) isNotEmpty.
]

{ #category : 'tests' }
XCTraceTest >> testNameOfASample [
	self assert: ((treeSamples second stackTrace frameNameAt: 10) asString sameAs: 'dyld4::Loader::getLoader(Diagnostics&, dyld4::RuntimeState&, char const*, dyld4::Loader::LoadOptions const&)').
]

{ #category : 'tests' }
XCTraceTest >> testProfilerTable [
	"For now primitive profile doesnt work properly"

	"The test for it is therefore pretty weak"

	| profile primitiveProfile |
	profile := VMDifferentialProfiler onFiles: { fr }.
	primitiveProfile := VMDifferentialPrimitiveProfiler onFiles: { fr }.

	self assert: (profile table first: 12) equals: 'Machine Code'.

	self assert: primitiveProfile table isString
]

{ #category : 'tests' }
XCTraceTest >> testSamplesTime [
	self assert: ((treeSamples first sampleTime) asString sameAs: '383060916').

]

{ #category : 'tests' }
XCTraceTest >> testSamplesWeight [
	self assert: ((treeSamples first weight) asString sameAs: '1000000').

]

{ #category : 'tests' }
XCTraceTest >> testSizeOfEmptySample [
	self assert: treeEmpty samples size equals: 0.
	
]

{ #category : 'tests' }
XCTraceTest >> testSizeOfSamplesWithContent [
	self assert: tree samples size equals: 2.
	
]

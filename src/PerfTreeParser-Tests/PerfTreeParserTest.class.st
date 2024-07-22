Class {
	#name : 'PerfTreeParserTest',
	#superclass : 'TestCase',
	#instVars : [
		'memoryFS',
		'fileSimple',
		'fileSamePercentage',
		'fileMultipleChildren',
		'testParserSimple',
		'testParserSamePercentage',
		'testParserMultipleChildren',
		'testNodeSimple',
		'testNodeSamePercentage',
		'testNodeMultipleChildren'
	],
	#category : 'PerfTreeParser-Tests',
	#package : 'PerfTreeParser-Tests'
}

{ #category : 'running' }
PerfTreeParserTest >> setUp [
	"For the commands ran, look at the README"

	super setUp.
	memoryFS := FileSystem memory.
	memoryFS / ('perf_stock_simple.txt') writeStreamDo: [:stream | stream nextPutAll: '# ========
# captured on    : Thu Jul  4 10:38:02 2024
# header version : 1
# data offset    : 352
# data size      : 197273944
# feat offset    : 197274296
# hostname : matburnx-laptop
# os release : 6.9.3-76060903-generic
# perf version : 6.9.3
# arch : x86_64
# nrcpus online : 12
# nrcpus avail : 12
# cpudesc : AMD Ryzen 5 4600H with Radeon Graphics
# cpuid : AuthenticAMD,23,96,1
# total memory : 15776048 kB
# cmdline : /usr/lib/linux-tools-6.9.3-76060903/perf record --no-buffering -g --call-graph=dwarf -- ./script.sh --all-user 
# event : name = cycles:P, , id = { 1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694, 1695 }, type = 0 (PERF_TYPE_HARDWARE), size = 136, config = 0 (PERF_COUNT_HW_CPU_CYCLES), { sample_period, sample_freq } = 4000, sample_type = IP|TID|TIME|ADDR|CALLCHAIN|PERIOD|REGS_USER|STACK_USER|DATA_SRC, read_format = ID|LOST, disabled = 1, inherit = 1, mmap = 1, comm = 1, freq = 1, enable_on_exec = 1, task = 1, precise_ip = 2, mmap_data = 1, sample_id_all = 1, exclude_callchain_user = 1, mmap2 = 1, comm_exec = 1, ksymbol = 1, bpf_event = 1, { wakeup_events, wakeup_watermark } = 1, sample_regs_user = 0xff0fff, sample_stack_user = 8192
# CPU_TOPOLOGY info available, use -I to display
# NUMA_TOPOLOGY info available, use -I to display
# pmu mappings: cpu = 4, amd_iommu_0 = 12, breakpoint = 5, ibs_fetch = 10, ibs_op = 11, kprobe = 8, msr = 13, power = 14, software = 1, tracepoint = 2, uprobe = 9
# CACHE info available, use -I to display
# time of first sample : 4882.047629
# time of last sample : 4887.986708
# sample duration :   5939.078 ms
# MEM_TOPOLOGY info available, use -I to display
# bpf_prog_info 2: bpf_prog_7cc47bbf07148bfe_hid_tail_call addr 0xffffffffc015e958 size 126
# bpf_prog_info 5: bpf_prog_e3dbd137be8d6168 addr 0xffffffffc015eb38 size 313
# bpf_prog_info 6: bpf_prog_6deef7357e7b4530 addr 0xffffffffc015ecb8 size 58
# bpf_prog_info 7: bpf_prog_6deef7357e7b4530 addr 0xffffffffc015ed10 size 58
# bpf_prog_info 8: bpf_prog_0ecd07b7b633809f addr 0xffffffffc0160e18 size 780
# bpf_prog_info 9: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0161148 size 94
# bpf_prog_info 10: bpf_prog_6deef7357e7b4530 addr 0xffffffffc01611cc size 94
# bpf_prog_info 11: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0168b14 size 667
# bpf_prog_info 12: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0169010 size 673
# bpf_prog_info 13: bpf_prog_8b9c33f36f812014 addr 0xffffffffc016b494 size 1111
# bpf_prog_info 14: bpf_prog_6deef7357e7b4530 addr 0xffffffffc016b918 size 95
# bpf_prog_info 15: bpf_prog_6deef7357e7b4530 addr 0xffffffffc016b998 size 95
# bpf_prog_info 19: bpf_prog_6deef7357e7b4530 addr 0xffffffffc01732d4 size 95
# bpf_prog_info 20: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0173358 size 95
# bpf_prog_info 21: bpf_prog_28a890580b33b0dc addr 0xffffffffc0176aac size 873
# bpf_prog_info 22: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0177488 size 677
# bpf_prog_info 26: bpf_prog_9705fcac2e5a1fc2_syscall__execve addr 0xffffffffc0195798 size 5366
# bpf_prog_info 27: bpf_prog_7f9f8929ef94c0a5_do_ret_sys_execve addr 0xffffffffc0196ce8 size 592
# btf info of id 5
# btf info of id 192
# cpu pmu capabilities: max_precise=0
# AMD systems uses ibs_op// PMU for some precise events, e.g.: cycles:p, see the ''perf list'' man page for further details.
# missing features: (null) BRANCH_STACK GROUP_DESC AUXTRACE STAT CLOCKID DIR_FORMAT COMPRESSED CLOCK_DATA HYBRID_TOPOLOGY 
# ========
#
#
# Total Lost Samples: 0
#
# Samples: 23K of event ''cycles:P''
# Event count (approx.): 10666908531
#
# Children      Self  Command          Shared Object                                Symbol                                                                                            
# ........  ........  ...............  ...........................................  ..................................................................................................
#
     3.31%     0.02%  pharo            [kernel.kallsyms]                            [k] do_syscall_64
            |          
             --3.29%--do_syscall_64
                       |          
                        --3.29%--entry_SYSCALL_64_after_hwframe
                                  |          
                                   --2.12%--__GI___libc_read (inlined)
'].

	memoryFS / ('perf_stock_same_percentage.txt') writeStreamDo: [:stream | stream nextPutAll: '# ========
# captured on    : Thu Jul  4 10:38:02 2024
# header version : 1
# data offset    : 352
# data size      : 197273944
# feat offset    : 197274296
# hostname : matburnx-laptop
# os release : 6.9.3-76060903-generic
# perf version : 6.9.3
# arch : x86_64
# nrcpus online : 12
# nrcpus avail : 12
# cpudesc : AMD Ryzen 5 4600H with Radeon Graphics
# cpuid : AuthenticAMD,23,96,1
# total memory : 15776048 kB
# cmdline : /usr/lib/linux-tools-6.9.3-76060903/perf record --no-buffering -g --call-graph=dwarf -- ./script.sh --all-user 
# event : name = cycles:P, , id = { 1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694, 1695 }, type = 0 (PERF_TYPE_HARDWARE), size = 136, config = 0 (PERF_COUNT_HW_CPU_CYCLES), { sample_period, sample_freq } = 4000, sample_type = IP|TID|TIME|ADDR|CALLCHAIN|PERIOD|REGS_USER|STACK_USER|DATA_SRC, read_format = ID|LOST, disabled = 1, inherit = 1, mmap = 1, comm = 1, freq = 1, enable_on_exec = 1, task = 1, precise_ip = 2, mmap_data = 1, sample_id_all = 1, exclude_callchain_user = 1, mmap2 = 1, comm_exec = 1, ksymbol = 1, bpf_event = 1, { wakeup_events, wakeup_watermark } = 1, sample_regs_user = 0xff0fff, sample_stack_user = 8192
# CPU_TOPOLOGY info available, use -I to display
# NUMA_TOPOLOGY info available, use -I to display
# pmu mappings: cpu = 4, amd_iommu_0 = 12, breakpoint = 5, ibs_fetch = 10, ibs_op = 11, kprobe = 8, msr = 13, power = 14, software = 1, tracepoint = 2, uprobe = 9
# CACHE info available, use -I to display
# time of first sample : 4882.047629
# time of last sample : 4887.986708
# sample duration :   5939.078 ms
# MEM_TOPOLOGY info available, use -I to display
# bpf_prog_info 2: bpf_prog_7cc47bbf07148bfe_hid_tail_call addr 0xffffffffc015e958 size 126
# bpf_prog_info 5: bpf_prog_e3dbd137be8d6168 addr 0xffffffffc015eb38 size 313
# bpf_prog_info 6: bpf_prog_6deef7357e7b4530 addr 0xffffffffc015ecb8 size 58
# bpf_prog_info 7: bpf_prog_6deef7357e7b4530 addr 0xffffffffc015ed10 size 58
# bpf_prog_info 8: bpf_prog_0ecd07b7b633809f addr 0xffffffffc0160e18 size 780
# bpf_prog_info 9: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0161148 size 94
# bpf_prog_info 10: bpf_prog_6deef7357e7b4530 addr 0xffffffffc01611cc size 94
# bpf_prog_info 11: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0168b14 size 667
# bpf_prog_info 12: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0169010 size 673
# bpf_prog_info 13: bpf_prog_8b9c33f36f812014 addr 0xffffffffc016b494 size 1111
# bpf_prog_info 14: bpf_prog_6deef7357e7b4530 addr 0xffffffffc016b918 size 95
# bpf_prog_info 15: bpf_prog_6deef7357e7b4530 addr 0xffffffffc016b998 size 95
# bpf_prog_info 19: bpf_prog_6deef7357e7b4530 addr 0xffffffffc01732d4 size 95
# bpf_prog_info 20: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0173358 size 95
# bpf_prog_info 21: bpf_prog_28a890580b33b0dc addr 0xffffffffc0176aac size 873
# bpf_prog_info 22: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0177488 size 677
# bpf_prog_info 26: bpf_prog_9705fcac2e5a1fc2_syscall__execve addr 0xffffffffc0195798 size 5366
# bpf_prog_info 27: bpf_prog_7f9f8929ef94c0a5_do_ret_sys_execve addr 0xffffffffc0196ce8 size 592
# btf info of id 5
# btf info of id 192
# cpu pmu capabilities: max_precise=0
# AMD systems uses ibs_op// PMU for some precise events, e.g.: cycles:p, see the ''perf list'' man page for further details.
# missing features: (null) BRANCH_STACK GROUP_DESC AUXTRACE STAT CLOCKID DIR_FORMAT COMPRESSED CLOCK_DATA HYBRID_TOPOLOGY 
# ========
#
#
# Total Lost Samples: 0
#
# Samples: 23K of event ''cycles:P''
# Event count (approx.): 10666908531
#
# Children      Self  Command          Shared Object                                Symbol                                                                                            
# ........  ........  ...............  ...........................................  ..................................................................................................
#
     10.65%     0.05%  pharo            libPharoVMCore.so                            [.] interpret
            |
            ---interpret
               |          
                --5.60%--enterSmalltalkExecutiveImplementation
                          interpret
                          runVMThread (inlined)
                          runOnMainThread (inlined)
                          vm_main_with_parameters
                          vm_main_with_parameters
                          vm_main
                          __libc_start_call_main
     0.00%     0.00%  sh               [kernel.kallsyms]           [k] ghes_notify_nmi
     0.00%     0.00%  sh               [kernel.kallsyms]           [k] nmi_cpu_backtrace'].

	memoryFS / ('perf_stock_multiple_children.txt') writeStreamDo: [:stream | stream nextPutAll: '# ========
# captured on    : Thu Jul  4 10:38:02 2024
# header version : 1
# data offset    : 352
# data size      : 197273944
# feat offset    : 197274296
# hostname : matburnx-laptop
# os release : 6.9.3-76060903-generic
# perf version : 6.9.3
# arch : x86_64
# nrcpus online : 12
# nrcpus avail : 12
# cpudesc : AMD Ryzen 5 4600H with Radeon Graphics
# cpuid : AuthenticAMD,23,96,1
# total memory : 15776048 kB
# cmdline : /usr/lib/linux-tools-6.9.3-76060903/perf record --no-buffering -g --call-graph=dwarf -- ./script.sh --all-user 
# event : name = cycles:P, , id = { 1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694, 1695 }, type = 0 (PERF_TYPE_HARDWARE), size = 136, config = 0 (PERF_COUNT_HW_CPU_CYCLES), { sample_period, sample_freq } = 4000, sample_type = IP|TID|TIME|ADDR|CALLCHAIN|PERIOD|REGS_USER|STACK_USER|DATA_SRC, read_format = ID|LOST, disabled = 1, inherit = 1, mmap = 1, comm = 1, freq = 1, enable_on_exec = 1, task = 1, precise_ip = 2, mmap_data = 1, sample_id_all = 1, exclude_callchain_user = 1, mmap2 = 1, comm_exec = 1, ksymbol = 1, bpf_event = 1, { wakeup_events, wakeup_watermark } = 1, sample_regs_user = 0xff0fff, sample_stack_user = 8192
# CPU_TOPOLOGY info available, use -I to display
# NUMA_TOPOLOGY info available, use -I to display
# pmu mappings: cpu = 4, amd_iommu_0 = 12, breakpoint = 5, ibs_fetch = 10, ibs_op = 11, kprobe = 8, msr = 13, power = 14, software = 1, tracepoint = 2, uprobe = 9
# CACHE info available, use -I to display
# time of first sample : 4882.047629
# time of last sample : 4887.986708
# sample duration :   5939.078 ms
# MEM_TOPOLOGY info available, use -I to display
# bpf_prog_info 2: bpf_prog_7cc47bbf07148bfe_hid_tail_call addr 0xffffffffc015e958 size 126
# bpf_prog_info 5: bpf_prog_e3dbd137be8d6168 addr 0xffffffffc015eb38 size 313
# bpf_prog_info 6: bpf_prog_6deef7357e7b4530 addr 0xffffffffc015ecb8 size 58
# bpf_prog_info 7: bpf_prog_6deef7357e7b4530 addr 0xffffffffc015ed10 size 58
# bpf_prog_info 8: bpf_prog_0ecd07b7b633809f addr 0xffffffffc0160e18 size 780
# bpf_prog_info 9: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0161148 size 94
# bpf_prog_info 10: bpf_prog_6deef7357e7b4530 addr 0xffffffffc01611cc size 94
# bpf_prog_info 11: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0168b14 size 667
# bpf_prog_info 12: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0169010 size 673
# bpf_prog_info 13: bpf_prog_8b9c33f36f812014 addr 0xffffffffc016b494 size 1111
# bpf_prog_info 14: bpf_prog_6deef7357e7b4530 addr 0xffffffffc016b918 size 95
# bpf_prog_info 15: bpf_prog_6deef7357e7b4530 addr 0xffffffffc016b998 size 95
# bpf_prog_info 19: bpf_prog_6deef7357e7b4530 addr 0xffffffffc01732d4 size 95
# bpf_prog_info 20: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0173358 size 95
# bpf_prog_info 21: bpf_prog_28a890580b33b0dc addr 0xffffffffc0176aac size 873
# bpf_prog_info 22: bpf_prog_ee0e253c78993a24 addr 0xffffffffc0177488 size 677
# bpf_prog_info 26: bpf_prog_9705fcac2e5a1fc2_syscall__execve addr 0xffffffffc0195798 size 5366
# bpf_prog_info 27: bpf_prog_7f9f8929ef94c0a5_do_ret_sys_execve addr 0xffffffffc0196ce8 size 592
# btf info of id 5
# btf info of id 192
# cpu pmu capabilities: max_precise=0
# AMD systems uses ibs_op// PMU for some precise events, e.g.: cycles:p, see the ''perf list'' man page for further details.
# missing features: (null) BRANCH_STACK GROUP_DESC AUXTRACE STAT CLOCKID DIR_FORMAT COMPRESSED CLOCK_DATA HYBRID_TOPOLOGY 
# ========
#
#
# Total Lost Samples: 0
#
# Samples: 23K of event ''cycles:P''
# Event count (approx.): 10666908531
#
# Children      Self  Command          Shared Object                                Symbol                                                                                            
# ........  ........  ...............  ...........................................  ..................................................................................................
#
     4.32%     0.02%  pharo            [kernel.kallsyms]                            [k] do_syscall_64
            |          
             --3.29%--do_syscall_64
                       |          
                        --3.29%--entry_SYSCALL_64_after_hwframe
                                  |          
                                  |--2.12%--__GI___libc_read (inlined)
                                  |          
                                   --0.35%--__GI___clock_nanosleep
                                             _nl_C_LC_CTYPE_tolower
'].

	fileSimple := memoryFS / ('perf_stock_simple.txt').
	testParserSimple := PerfTreeParser fromFile: fileSimple.
	testNodeSimple := (PerfTreeParser parseFile: fileSimple) first.
	
	fileSamePercentage := memoryFS / ('perf_stock_same_percentage.txt').
	testParserSamePercentage := PerfTreeParser fromFile: fileSamePercentage.
	testNodeSamePercentage := (PerfTreeParser parseFile: fileSamePercentage) first.
	
	fileMultipleChildren := memoryFS / ('perf_stock_multiple_children.txt').
	testParserMultipleChildren := PerfTreeParser fromFile: fileMultipleChildren.
	testNodeMultipleChildren := (PerfTreeParser parseFile: fileMultipleChildren) first.
	
]

{ #category : 'running' }
PerfTreeParserTest >> tearDown [
	
	fileSimple ensureDelete.
	fileSamePercentage ensureDelete.
	fileMultipleChildren ensureDelete.
	super tearDown
]

{ #category : 'tests' }
PerfTreeParserTest >> testDifferenceOfSpacesAt [

	self
		assert: (testParserSamePercentage differenceOfSpacesAt: 3)
		equals: 10.

	self
		assert: (testParserSamePercentage differenceOfSpacesAt: 1)
		equals: 7.

	self assert:
		(testParserSamePercentage differenceOfSpacesAt: 5) isZero
]

{ #category : 'tests' }
PerfTreeParserTest >> testFindParentIndexOfIndex [
	"Classical case"

	self
		assert: (testParserSamePercentage findParentIndexOfIndex: 5)
		equals: { 6 } asOrderedCollection
]

{ #category : 'tests' }
PerfTreeParserTest >> testFindParentIndexOfIndexWithMutltipleParent [
	"Multiple children"

	self
		assert: (testParserMultipleChildren findParentIndexOfIndex: 3)
		equals: { 4. 5 } asOrderedCollection
]

{ #category : 'tests' }
PerfTreeParserTest >> testFindParentIndexOfIndexWithNoParent [
	"The last has no children"

	self assert: (testParserSimple findParentIndexOfIndex:
			 testParserSimple numberOfFunctions) isEmpty
]

{ #category : 'tests' }
PerfTreeParserTest >> testFindParentIndexOfIndexWithSameNumberOfSpaces [
	"Case where 2 functions have the same number of spaces."

	self
		assert: (testParserSimple findParentIndexOfIndex: 3)
		equals: { 4 } asOrderedCollection
]

{ #category : 'tests' }
PerfTreeParserTest >> testFindParentOfIndex [

	| aNode |
	aNode := testParserMultipleChildren findParentOfIndex: 3.

	self
		assert: aNode first name
		equals: (testParserMultipleChildren nameOf: 4).
	self
		assert: aNode second name
		equals: (testParserMultipleChildren nameOf: 5)
]

{ #category : 'tests' }
PerfTreeParserTest >> testFindParentOfRecursive [

	| aNode |
	aNode := testNodeMultipleChildren firstParent firstParent.

	self
		assert: aNode parents first name
		equals: (testParserMultipleChildren nameOf: 4).
	self
		assert: aNode parents second firstParent name
		equals: (testParserMultipleChildren nameOf: 6)
]

{ #category : 'tests' }
PerfTreeParserTest >> testHardestCall [

	| multipleChildrenTree multipleChildrenTraces samePercentageTraces samePercentageTree |
	multipleChildrenTraces := testNodeMultipleChildren traces.
	multipleChildrenTree := PerfTreeTree new traces:
		                        multipleChildrenTraces.

	samePercentageTraces := testNodeSamePercentage traces.
	samePercentageTree := PerfTreeTree new traces: samePercentageTraces.

	self
		assert: multipleChildrenTree hardestCall name
		equals: 'do_syscall_64'.

	self assert: samePercentageTree hardestCall name equals: 'interpret'
]

{ #category : 'tests' }
PerfTreeParserTest >> testIsLeaf [

	self assert: testNodeSimple isLeaf.

	self assert: testNodeSimple firstParent isLeaf not
]

{ #category : 'tests' }
PerfTreeParserTest >> testIsNotLeaf [

	self assert: testNodeSimple isNotLeaf not.

	self assert: testNodeSimple firstParent isNotLeaf
]

{ #category : 'tests' }
PerfTreeParserTest >> testLastSpaceAt [

	self assert: (testParserSimple lastSpaceAt: 1) equals: 88.
	
	self assert: (testParserSimple lastSpaceAt: 2) equals: 22.
]

{ #category : 'tests' }
PerfTreeParserTest >> testNameOf [
	"Three cases where the parsing is different."

	self assert: (testParserSimple nameOf: 1) equals: 'do_syscall_64'.

	self
		assert: (testParserSimple nameOf: 3)
		equals: 'entry_SYSCALL_64_after_hwframe'.

	self
		assert: (testParserSimple nameOf: 4)
		equals: '__GI___libc_read (inlined)'
]

{ #category : 'tests' }
PerfTreeParserTest >> testNodeAtIndex [

	"Needs more tests!!!"
]

{ #category : 'tests' }
PerfTreeParserTest >> testNodes [

	| example |
	example := testNodeMultipleChildren firstParent firstParent parents.

	self assert: example first name equals: '__GI___libc_read (inlined)'.

	self assert: example second name equals: '__GI___clock_nanosleep'
]

{ #category : 'tests' }
PerfTreeParserTest >> testNodesSameParent [

	| example |
	example := testNodeMultipleChildren firstParent firstParent parents.

	self
		assert: testNodeMultipleChildren firstParent firstParent
		equals: example first child.

	self assert: example first child equals: example second child
]

{ #category : 'tests' }
PerfTreeParserTest >> testNumberOfFunctions [

	self assert: testParserSimple numberOfFunctions equals: 4
]

{ #category : 'tests' }
PerfTreeParserTest >> testNumberOfSpacesAt [

	self
		assert:
		(testParserSimple numberOfSpacesAt:
			 testParserSimple numberOfFunctions)
		equals: 35.

	self assert: (testParserSimple numberOfSpacesAt: 1) equals: 5.

	self assert: (testParserSimple numberOfSpacesAt: 3) equals: 24
]

{ #category : 'tests' }
PerfTreeParserTest >> testPercentageOf [
	"Cases with 4 digits."

	self assert: (testParserSamePercentage percentageOf: 1) equals: 10.65
]

{ #category : 'tests' }
PerfTreeParserTest >> testPercentageOfWith3Digits [
	"Case with 3 digits."

	self
		assert: (testParserMultipleChildren percentageOf: 5)
		equals: 0.35
]

{ #category : 'tests' }
PerfTreeParserTest >> testPercentageOfWithSamePercentage [
	"Case with same percentage"

	self
		assert: (testParserSamePercentage percentageOf: 4)
		equals: (testParserSamePercentage percentageOf: 5).

	self
		assert: (testParserSamePercentage percentageOf: 5)
		equals: (testParserSamePercentage percentageOf: 6)
]

{ #category : 'tests' }
PerfTreeParserTest >> testRawPercentageOf [
	"Cases with 4 digits."

	self assert: (testParserSimple rawPercentageOf: 1) equals: '3.31'.

	self
		assert: testNodeSimple rawPercentage
		equals: (testParserSimple rawPercentageOf: 1).

	self
		assert: (testParserSimple rawPercentageOf: 1)
		equals: testNodeSimple traces first rawPercentage
]

{ #category : 'tests' }
PerfTreeParserTest >> testRawPercentageOfWith3Digits [
	"Case with 3 digits."

	self
		assert: (testParserMultipleChildren rawPercentageOf: 6)
		equals: '0.35'.

	self
		assert: testNodeMultipleChildren traces last rawPercentage
		equals: (testParserMultipleChildren rawPercentageOf: 1)
]

{ #category : 'tests' }
PerfTreeParserTest >> testRawPercentageOfWithSamePercentage [
	"Case with same percentage"

	self
		assert: (testParserSamePercentage rawPercentageOf: 4)
		equals: (testParserSamePercentage rawPercentageOf: 5).

	self
		assert: (testParserSamePercentage rawPercentageOf: 5)
		equals: (testParserSamePercentage rawPercentageOf: 6)
]

{ #category : 'tests' }
PerfTreeParserTest >> testReadLine [

	self
		assert: (testParserSimple readLine: 3)
		equals:
		'                        --3.29%--entry_SYSCALL_64_after_hwframe'.

	self
		assert:
		(testParserSimple readLine: testParserSimple numberOfFunctions)
		equals:
		'                                   --2.12%--__GI___libc_read (inlined)'
]

{ #category : 'tests' }
PerfTreeParserTest >> testRealPercentageOf [

	self
		assert:
		(testParserSimple realPercentageOf:
			 testParserSimple numberOfFunctions)
		equals:
		(testParserSimple percentageOf: testParserSimple numberOfFunctions).

	self
		assert: (testParserSamePercentage realPercentageOf: 2)
		equals: 5.05.

	self
		assert: (testParserSamePercentage realPercentageOf: 4)
		equals: 0.0
]

{ #category : 'tests' }
PerfTreeParserTest >> testSmallTrees [

	| lastTree beforeTheLastTree |
	lastTree := (PerfTreeParser parseFile: fileSamePercentage) last.
	beforeTheLastTree := (PerfTreeParser parseFile: fileSamePercentage) second.
	
	self assert: beforeTheLastTree parents isEmpty.
	self assert: lastTree parents isEmpty.

	
]

{ #category : 'tests' }
PerfTreeParserTest >> testTime [

	| example |
	example := testNodeMultipleChildren firstParent firstParent.

	self assert: example time equals: 48.7
]

{ #category : 'tests' }
PerfTreeParserTest >> testTimeOf [

	self
		assert:
		(testParserSimple timeOf: testParserSimple numberOfFunctions)
		equals: 125.91.

	self assert: (testParserSimple timeOf: 3) equals: 69.49
]

{ #category : 'tests' }
PerfTreeParserTest >> testTimeWithParentOf [

	self
		assert:
		(testParserSimple timeWithParentOf:
			 testParserSimple numberOfFunctions)
		equals:
		(testParserSimple timeOf: testParserSimple numberOfFunctions).

	self
		assert: (testParserMultipleChildren timeWithParentOf: 3)
		equals: 195.4.

	self
		assert: (testParserSamePercentage timeWithParentOf: 5)
		equals: 332.59
]

{ #category : 'tests' }
PerfTreeParserTest >> testTotalTime [
	
	self assert: testParserSimple time equals: 5939.078.
	
	self assert: testParserSimple roots first totalTime equals: 5939.078.
]

{ #category : 'tests' }
PerfTreeParserTest >> testTraces [

	| traces |
	traces := (PerfTreeParser findTraces: fileSimple) first.

	self assert: traces first name equals: 'do_syscall_64'.
]

{ #category : 'tests' }
PerfTreeParserTest >> testTracesNumber [

	| traces secondTraces |
	traces := (PerfTreeParser findTraces: fileSimple) first.
	secondTraces := testNodeMultipleChildren traces.

	self assert: traces size equals: 1.

	self assert: secondTraces size equals: 1.

]

{ #category : 'tests' }
PerfTreeParserTest >> testTracesTime [

	| traces secondTraces |
	traces := (PerfTreeParser findTraces: fileSimple) first.
	secondTraces := testNodeMultipleChildren traces first.

	self assert: traces first time equals: 1.19.

	self assert: secondTraces time equals: 61.17
]

{ #category : 'tests' }
PerfTreeParserTest >> testTreeTotalTime [
	
	| multipleChildrenTree multipleChildrenTraces simpleTraces simpleTree |
	multipleChildrenTraces := testNodeMultipleChildren traces.
	multipleChildrenTree := PerfTreeTree new traces: multipleChildrenTraces.
	
	simpleTraces := testNodeSimple traces.
	simpleTree := PerfTreeTree new traces: simpleTraces.
	
	self assert: multipleChildrenTree totalTime equals: 61.17.
	
	self assert: simpleTree totalTime equals: 1.19
]

{ #category : 'tests' }
PerfTreeParserTest >> testWithoutSpaces [

	self assert: (testParserMultipleChildren withoutSpaces at: 3) equals: '--3.29%--entry_SYSCALL_64_after_hwframe'
]

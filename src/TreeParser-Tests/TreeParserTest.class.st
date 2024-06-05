Class {
	#name : #TreeParserTest,
	#superclass : #TestCase,
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
	#category : #'TreeParser-Tests'
}

{ #category : #running }
TreeParserTest >> setUp [
	"Commands ran:"
	"sudo perf record -g --call-graph=dwarf -- ./script2.sh --all-user"
	"sudo perf report --header --stdio > perf_example.txt"

	super setUp.
	memoryFS := FileSystem memory.
	memoryFS / ('perf_stock_simple.txt') writeStreamDo: [:stream | stream nextPutAll: '# ========
# captured on    : Wed May 29 09:28:58 2024
# header version : 1
# data offset    : 352
# data size      : 16366888
# feat offset    : 16367240
# hostname : matburnx-laptop
# os release : 6.8.0-76060800daily20240311-generic
# perf version : 6.8.0
# arch : x86_64
# nrcpus online : 12
# nrcpus avail : 12
# cpudesc : AMD Ryzen 5 4600H with Radeon Graphics
# cpuid : AuthenticAMD,23,96,1
# total memory : 15776888 kB
# cmdline : /usr/lib/linux-tools-6.8.0-76060800daily20240311/perf record -g --call-graph=dwarf -- ./script2.sh --all-user 
# event : name = cycles:P, , id = { 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287 }, type = 0 (PERF_TYPE_HARDWARE), size = 136, config = 0 (PERF_COUNT_HW_CPU_CYCLES), { sample_period, sample_freq } = 4000, sample_type = IP|TID|TIME|ADDR|CALLCHAIN|PERIOD|REGS_USER|STACK_USER|DATA_SRC, read_format = ID|LOST, disabled = 1, inherit = 1, mmap = 1, comm = 1, freq = 1, enable_on_exec = 1, task = 1, precise_ip = 2, mmap_data = 1, sample_id_all = 1, exclude_callchain_user = 1, mmap2 = 1, comm_exec = 1, ksymbol = 1, bpf_event = 1, sample_regs_user = 0xff0fff, sample_stack_user = 8192
# CPU_TOPOLOGY info available, use -I to display
# NUMA_TOPOLOGY info available, use -I to display
# pmu mappings: cpu = 4, amd_iommu_0 = 12, breakpoint = 5, ibs_fetch = 10, ibs_op = 11, kprobe = 8, msr = 13, power = 14, software = 1, tracepoint = 2, uprobe = 9
# CACHE info available, use -I to display
# time of first sample : 924.754662
# time of last sample : 925.152255
# sample duration :    397.592 ms
# MEM_TOPOLOGY info available, use -I to display
# bpf_prog_info 2: bpf_prog_7cc47bbf07148bfe_hid_tail_call addr 0xffffffffc0314954 size 110
# bpf_prog_info 5: bpf_prog_e3dbd137be8d6168 addr 0xffffffffc0314b30 size 313
# bpf_prog_info 6: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0314c9c size 58
# bpf_prog_info 7: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0314d2c size 58
# bpf_prog_info 8: bpf_prog_0ecd07b7b633809f addr 0xffffffffc0316e30 size 777
# bpf_prog_info 9: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0317158 size 95
# bpf_prog_info 10: bpf_prog_6deef7357e7b4530 addr 0xffffffffc03171d8 size 95
# bpf_prog_info 11: bpf_prog_ee0e253c78993a24 addr 0xffffffffc031eb10 size 675
# bpf_prog_info 12: bpf_prog_ee0e253c78993a24 addr 0xffffffffc031f018 size 671
# bpf_prog_info 13: bpf_prog_8b9c33f36f812014 addr 0xffffffffc03214a4 size 1109
# bpf_prog_info 14: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0321914 size 95
# bpf_prog_info 15: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0321994 size 94
# bpf_prog_info 19: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0328bdc size 94
# bpf_prog_info 20: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0328c48 size 95
# bpf_prog_info 21: bpf_prog_28a890580b33b0dc addr 0xffffffffc032b50c size 872
# bpf_prog_info 22: bpf_prog_ee0e253c78993a24 addr 0xffffffffc032d4d0 size 673
# bpf_prog_info 29: bpf_prog_6be0d743674e5faa_syscall__execve addr 0xffffffffc034c570 size 5360
# bpf_prog_info 30: bpf_prog_a43530058ef998f5_do_ret_sys_execve addr 0xffffffffc034daa0 size 589
# btf info of id 5
# btf info of id 176
# cpu pmu capabilities: max_precise=0
# AMD systems uses ibs_op// PMU for some precise events, e.g.: cycles:p, see the ''perf list'' man page for further details.
# missing features: (null) BRANCH_STACK GROUP_DESC AUXTRACE STAT CLOCKID DIR_FORMAT COMPRESSED CLOCK_DATA HYBRID_TOPOLOGY 
# ========
#
#
# Total Lost Samples: 0
#
# Samples: 1K of event ''cycles:P''
# Event count (approx.): 963528052
#
# Children      Self  Command          Shared Object                              Symbol                                                   
# ........  ........  ...............  .........................................  .........................................................
#
    46.02%     0.00%  pharo            [kernel.kallsyms]                          [k] entry_SYSCALL_64_after_hwframe
            |
            ---entry_SYSCALL_64_after_hwframe
               |          
                --45.91%--do_syscall_64
                          |          
                          |--36.78%--__x64_sys_read
'].

	memoryFS / ('perf_stock_same_percentage.txt') writeStreamDo: [:stream | stream nextPutAll: '# ========
# captured on    : Wed May 29 09:28:58 2024
# header version : 1
# data offset    : 352
# data size      : 16366888
# feat offset    : 16367240
# hostname : matburnx-laptop
# os release : 6.8.0-76060800daily20240311-generic
# perf version : 6.8.0
# arch : x86_64
# nrcpus online : 12
# nrcpus avail : 12
# cpudesc : AMD Ryzen 5 4600H with Radeon Graphics
# cpuid : AuthenticAMD,23,96,1
# total memory : 15776888 kB
# cmdline : /usr/lib/linux-tools-6.8.0-76060800daily20240311/perf record -g --call-graph=dwarf -- ./script2.sh --all-user 
# event : name = cycles:P, , id = { 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287 }, type = 0 (PERF_TYPE_HARDWARE), size = 136, config = 0 (PERF_COUNT_HW_CPU_CYCLES), { sample_period, sample_freq } = 4000, sample_type = IP|TID|TIME|ADDR|CALLCHAIN|PERIOD|REGS_USER|STACK_USER|DATA_SRC, read_format = ID|LOST, disabled = 1, inherit = 1, mmap = 1, comm = 1, freq = 1, enable_on_exec = 1, task = 1, precise_ip = 2, mmap_data = 1, sample_id_all = 1, exclude_callchain_user = 1, mmap2 = 1, comm_exec = 1, ksymbol = 1, bpf_event = 1, sample_regs_user = 0xff0fff, sample_stack_user = 8192
# CPU_TOPOLOGY info available, use -I to display
# NUMA_TOPOLOGY info available, use -I to display
# pmu mappings: cpu = 4, amd_iommu_0 = 12, breakpoint = 5, ibs_fetch = 10, ibs_op = 11, kprobe = 8, msr = 13, power = 14, software = 1, tracepoint = 2, uprobe = 9
# CACHE info available, use -I to display
# time of first sample : 924.754662
# time of last sample : 925.152255
# sample duration :    397.592 ms
# MEM_TOPOLOGY info available, use -I to display
# bpf_prog_info 2: bpf_prog_7cc47bbf07148bfe_hid_tail_call addr 0xffffffffc0314954 size 110
# bpf_prog_info 5: bpf_prog_e3dbd137be8d6168 addr 0xffffffffc0314b30 size 313
# bpf_prog_info 6: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0314c9c size 58
# bpf_prog_info 7: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0314d2c size 58
# bpf_prog_info 8: bpf_prog_0ecd07b7b633809f addr 0xffffffffc0316e30 size 777
# bpf_prog_info 9: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0317158 size 95
# bpf_prog_info 10: bpf_prog_6deef7357e7b4530 addr 0xffffffffc03171d8 size 95
# bpf_prog_info 11: bpf_prog_ee0e253c78993a24 addr 0xffffffffc031eb10 size 675
# bpf_prog_info 12: bpf_prog_ee0e253c78993a24 addr 0xffffffffc031f018 size 671
# bpf_prog_info 13: bpf_prog_8b9c33f36f812014 addr 0xffffffffc03214a4 size 1109
# bpf_prog_info 14: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0321914 size 95
# bpf_prog_info 15: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0321994 size 94
# bpf_prog_info 19: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0328bdc size 94
# bpf_prog_info 20: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0328c48 size 95
# bpf_prog_info 21: bpf_prog_28a890580b33b0dc addr 0xffffffffc032b50c size 872
# bpf_prog_info 22: bpf_prog_ee0e253c78993a24 addr 0xffffffffc032d4d0 size 673
# bpf_prog_info 29: bpf_prog_6be0d743674e5faa_syscall__execve addr 0xffffffffc034c570 size 5360
# bpf_prog_info 30: bpf_prog_a43530058ef998f5_do_ret_sys_execve addr 0xffffffffc034daa0 size 589
# btf info of id 5
# btf info of id 176
# cpu pmu capabilities: max_precise=0
# AMD systems uses ibs_op// PMU for some precise events, e.g.: cycles:p, see the ''perf list'' man page for further details.
# missing features: (null) BRANCH_STACK GROUP_DESC AUXTRACE STAT CLOCKID DIR_FORMAT COMPRESSED CLOCK_DATA HYBRID_TOPOLOGY 
# ========
#
#
# Total Lost Samples: 0
#
# Samples: 1K of event ''cycles:P''
# Event count (approx.): 963528052
#
# Children      Self  Command          Shared Object                              Symbol                                                   
# ........  ........  ...............  .........................................  .........................................................
#
    46.02%     0.00%  pharo            [kernel.kallsyms]                          [k] entry_SYSCALL_64_after_hwframe
            |
            ---entry_SYSCALL_64_after_hwframe
               |          
                --45.91%--do_syscall_64
                          |          
                          |--36.78%--__x64_sys_read
                          |          ksys_read
                          |          vfs_read
                          |          |          
                          |           --36.46%--ext4_file_read_iter
                          |                     |          
'].

	memoryFS / ('perf_stock_multiple_children.txt') writeStreamDo: [:stream | stream nextPutAll: '# ========
# captured on    : Wed May 29 09:28:58 2024
# header version : 1
# data offset    : 352
# data size      : 16366888
# feat offset    : 16367240
# hostname : matburnx-laptop
# os release : 6.8.0-76060800daily20240311-generic
# perf version : 6.8.0
# arch : x86_64
# nrcpus online : 12
# nrcpus avail : 12
# cpudesc : AMD Ryzen 5 4600H with Radeon Graphics
# cpuid : AuthenticAMD,23,96,1
# total memory : 15776888 kB
# cmdline : /usr/lib/linux-tools-6.8.0-76060800daily20240311/perf record -g --call-graph=dwarf -- ./script2.sh --all-user 
# event : name = cycles:P, , id = { 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287 }, type = 0 (PERF_TYPE_HARDWARE), size = 136, config = 0 (PERF_COUNT_HW_CPU_CYCLES), { sample_period, sample_freq } = 4000, sample_type = IP|TID|TIME|ADDR|CALLCHAIN|PERIOD|REGS_USER|STACK_USER|DATA_SRC, read_format = ID|LOST, disabled = 1, inherit = 1, mmap = 1, comm = 1, freq = 1, enable_on_exec = 1, task = 1, precise_ip = 2, mmap_data = 1, sample_id_all = 1, exclude_callchain_user = 1, mmap2 = 1, comm_exec = 1, ksymbol = 1, bpf_event = 1, sample_regs_user = 0xff0fff, sample_stack_user = 8192
# CPU_TOPOLOGY info available, use -I to display
# NUMA_TOPOLOGY info available, use -I to display
# pmu mappings: cpu = 4, amd_iommu_0 = 12, breakpoint = 5, ibs_fetch = 10, ibs_op = 11, kprobe = 8, msr = 13, power = 14, software = 1, tracepoint = 2, uprobe = 9
# CACHE info available, use -I to display
# time of first sample : 924.754662
# time of last sample : 925.152255
# sample duration :    397.592 ms
# MEM_TOPOLOGY info available, use -I to display
# bpf_prog_info 2: bpf_prog_7cc47bbf07148bfe_hid_tail_call addr 0xffffffffc0314954 size 110
# bpf_prog_info 5: bpf_prog_e3dbd137be8d6168 addr 0xffffffffc0314b30 size 313
# bpf_prog_info 6: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0314c9c size 58
# bpf_prog_info 7: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0314d2c size 58
# bpf_prog_info 8: bpf_prog_0ecd07b7b633809f addr 0xffffffffc0316e30 size 777
# bpf_prog_info 9: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0317158 size 95
# bpf_prog_info 10: bpf_prog_6deef7357e7b4530 addr 0xffffffffc03171d8 size 95
# bpf_prog_info 11: bpf_prog_ee0e253c78993a24 addr 0xffffffffc031eb10 size 675
# bpf_prog_info 12: bpf_prog_ee0e253c78993a24 addr 0xffffffffc031f018 size 671
# bpf_prog_info 13: bpf_prog_8b9c33f36f812014 addr 0xffffffffc03214a4 size 1109
# bpf_prog_info 14: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0321914 size 95
# bpf_prog_info 15: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0321994 size 94
# bpf_prog_info 19: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0328bdc size 94
# bpf_prog_info 20: bpf_prog_6deef7357e7b4530 addr 0xffffffffc0328c48 size 95
# bpf_prog_info 21: bpf_prog_28a890580b33b0dc addr 0xffffffffc032b50c size 872
# bpf_prog_info 22: bpf_prog_ee0e253c78993a24 addr 0xffffffffc032d4d0 size 673
# bpf_prog_info 29: bpf_prog_6be0d743674e5faa_syscall__execve addr 0xffffffffc034c570 size 5360
# bpf_prog_info 30: bpf_prog_a43530058ef998f5_do_ret_sys_execve addr 0xffffffffc034daa0 size 589
# btf info of id 5
# btf info of id 176
# cpu pmu capabilities: max_precise=0
# AMD systems uses ibs_op// PMU for some precise events, e.g.: cycles:p, see the ''perf list'' man page for further details.
# missing features: (null) BRANCH_STACK GROUP_DESC AUXTRACE STAT CLOCKID DIR_FORMAT COMPRESSED CLOCK_DATA HYBRID_TOPOLOGY 
# ========
#
#
# Total Lost Samples: 0
#
# Samples: 1K of event ''cycles:P''
# Event count (approx.): 963528052
#
# Children      Self  Command          Shared Object                              Symbol                                                   
# ........  ........  ...............  .........................................  .........................................................
#
    46.02%     0.00%  pharo            [kernel.kallsyms]                          [k] entry_SYSCALL_64_after_hwframe
            |
            ---entry_SYSCALL_64_after_hwframe
               |          
                --45.91%--do_syscall_64
                          |          
                          |--36.78%--__x64_sys_read
                          |
                          |          
                          |--6.88%--syscall_exit_to_user_mode
                          |          |          
                          |           --6.86%--arch_do_signal_or_restart
                          |                     |          
                          |                      --6.86%--get_signal
                          |          
                           --0.53%--__x64_sys_openat
                                     do_sys_openat2
'].

	fileSimple := memoryFS / ('perf_stock_simple.txt').
	testParserSimple := TreeParser fromFile: fileSimple.
	testNodeSimple := TreeParser parseFile: fileSimple.
	
	fileSamePercentage := memoryFS / ('perf_stock_same_percentage.txt').
	testParserSamePercentage := TreeParser fromFile: fileSamePercentage.
	testNodeSamePercentage := TreeParser parseFile: fileSamePercentage.
	
	fileMultipleChildren := memoryFS / ('perf_stock_multiple_children.txt').
	testParserMultipleChildren := TreeParser fromFile: fileMultipleChildren.
	testNodeMultipleChildren := TreeParser parseFile: fileMultipleChildren.
	
]

{ #category : #running }
TreeParserTest >> tearDown [

	fileSimple ensureDelete.
	fileSamePercentage ensureDelete.
	fileMultipleChildren ensureDelete.
	super tearDown
]

{ #category : #tests }
TreeParserTest >> testDifferenceOfSpacesAt [

	self assert: (testParserSimple differenceOfSpacesAt: 0) isZero.
	
	self assert: (testParserSimple differenceOfSpacesAt: 5) isZero.
	
	"Classical case"
	self assert: (testParserSamePercentage differenceOfSpacesAt: 6) equals: 1.
	
	self assert: (testParserSamePercentage differenceOfSpacesAt: 1) equals: 8.
	
	self assert: (testParserSamePercentage differenceOfSpacesAt: 5) isZero.
]

{ #category : #tests }
TreeParserTest >> testFindChildrenIndexOfIndex [
	"Two cases that shouldn't happen."

	self assert: (testParserSimple findChildrenIndexOfIndex: 0) isZero.

	self assert: (testParserSimple findChildrenIndexOfIndex: 5) isZero.

	"The last has no children"

	self assert: (testParserSimple findChildrenIndexOfIndex: 4) isEmpty.

	"Case where 2 functions have the same number of spaces."
	self
		assert: (testParserSimple findChildrenIndexOfIndex: 3)
		equals: { 4 } asOrderedCollection.

	"Classical case"
	self
		assert: (testParserSamePercentage findChildrenIndexOfIndex: 5)
		equals: { 6 } asOrderedCollection.

	"Multiple children"
	self
		assert: (testParserMultipleChildren findChildrenIndexOfIndex: 3)
		equals: { 4. 5. 8 } asOrderedCollection
]

{ #category : #tests }
TreeParserTest >> testFindChildrenOfIndex [

	| aNode |
	aNode := testParserMultipleChildren findChildrenOfIndex: 3.

	self
		assert: aNode first name
		equals: (testParserMultipleChildren nameOf: 4).
	self
		assert: aNode second name
		equals: (testParserMultipleChildren nameOf: 5).
	self
		assert: aNode third name
		equals: (testParserMultipleChildren nameOf: 8)
]

{ #category : #tests }
TreeParserTest >> testFindChildrenOfRecursive [

	| aNode |
	aNode := testNodeMultipleChildren firstChild firstChild.

	self
		assert: aNode children second children first name
		equals: (testParserMultipleChildren nameOf: 6).
	self
		assert: aNode children second children first children first name
		equals: (testParserMultipleChildren nameOf: 7)
]

{ #category : #tests }
TreeParserTest >> testIsLeaf [

	| example |
	example := testNodeSimple firstChild firstChild.
	
	self assert: example isLeaf not.
	self assert: example isNotLeaf.
	
	self assert: example children first isLeaf.
	self assert: example children first isNotLeaf not.
]

{ #category : #tests }
TreeParserTest >> testLastSpaceAt [

	self assert: (testParserSimple lastSpaceAt: 0) isNil.
	
	self assert: (testParserSimple lastSpaceAt: 5) isNil.
	
	self assert: (testParserSimple lastSpaceAt: 1) equals: 86.
	
	self assert: (testParserSimple lastSpaceAt: 2) equals: 15.
]

{ #category : #tests }
TreeParserTest >> testNameOf [

	"Limit cases"
	self assert: (testParserSimple nameOf: 0) isNil.
	
	self assert: (testParserSimple nameOf: 5) isNil.

	"Three cases where the parsing is different."
	self assert: (testParserSimple nameOf: 1) equals: 'entry_SYSCALL_64_after_hwframe'.

	self assert: (testParserSamePercentage nameOf: 4) equals: '__x64_sys_read'.
	
	self assert: (testParserSamePercentage nameOf: 6) equals: 'vfs_read'
]

{ #category : #tests }
TreeParserTest >> testNodeAtIndexWithParent [

	self assert: (testParserSimple nodeAtIndex: 0 withParent: nil) isNil.
	
	self assert: (testParserSimple nodeAtIndex: 5 withParent: nil) isNil.
	
	"Needs more tests!!!"
]

{ #category : #tests }
TreeParserTest >> testNodes [

	| example |
	example := testNodeMultipleChildren firstChild firstChild children.

	self assert: example first name equals: '__x64_sys_read'.

	self assert: example second name equals: 'syscall_exit_to_user_mode'.

	self assert: example third name equals: '__x64_sys_openat'
]

{ #category : #tests }
TreeParserTest >> testNodesSameParent [
	
	| example |
	example := (testNodeMultipleChildren firstChild firstChild) children.
	
	self assert: testNodeMultipleChildren children first children first equals: example first parent.
	
	self assert: example first parent equals: example second parent
]

{ #category : #tests }
TreeParserTest >> testNumberOfFunctions [

	self assert: (testParserSimple numberOfFunctions) equals: 4
]

{ #category : #tests }
TreeParserTest >> testNumberOfSpacesAt [

	
	self assert: (testParserSimple numberOfSpacesAt: 0) isZero.
	
	self assert: (testParserSimple numberOfSpacesAt: 5) isZero.

	self assert: (testParserSimple numberOfSpacesAt: 1) equals: 4.
	
	self assert: (testParserSimple numberOfSpacesAt: 3) equals: 16
]

{ #category : #tests }
TreeParserTest >> testPercentageOf [
	"Limit cases"

	self assert: (testParserSimple percentageOf: 0) isZero.

	self assert: (testParserSimple percentageOf: 5) isZero.

	"Cases with 4 digits."
	self assert: (testParserSimple percentageOf: 3) equals: 45.91.

	self assert: (testParserSimple percentageOf: 1) equals: 46.02.

	"Case with 3 digits."
	self assert: (testParserMultipleChildren percentageOf: 8) equals: 0.53.

	"Case with same percentage"
	self
		assert: (testParserSamePercentage percentageOf: 4)
		equals: (testParserSamePercentage percentageOf: 5).
	
	self
		assert: (testParserSamePercentage percentageOf: 5)
		equals: (testParserSamePercentage percentageOf: 6)
	
]

{ #category : #tests }
TreeParserTest >> testReadLine [

	"Limit cases."
	self assert: (testParserSimple readLine: 0) isNil.
	
	self assert: (testParserSimple readLine: 5) isNil.

	self assert: (testParserSimple readLine: 3) equals: '                --45.91%--do_syscall_64'
]

{ #category : #tests }
TreeParserTest >> testRealPercentageOf [

	"Limit cases."
	self assert: (testParserSimple realPercentageOf: 0) isZero.

	self assert: (testParserSimple realPercentageOf: 5) isZero.

	self
		assert: (testParserSamePercentage realPercentageOf: 3)
		equals: 9.13.

	self assert: (testParserSamePercentage realPercentageOf: 4) equals: 0.0
]

{ #category : #tests }
TreeParserTest >> testTime [
	
	self assert: testParserSimple time equals: 397.592.
	
	self assert: testParserSimple root time equals: 397.592.
]

{ #category : #tests }
TreeParserTest >> testTraces [

	| traces |
	traces := testNodeSimple traces.

	self assert: traces size equals: 1.
	
	self assert: traces first name equals: '__x64_sys_read'.
	
	self assert: traces first weight equals: 146.24.
]

{ #category : #tests }
TreeParserTest >> testWeight [
	
	| example |
	example := testNodeMultipleChildren firstChild firstChild.
	
	self assert: example weight equals: 6.84.
]

{ #category : #tests }
TreeParserTest >> testWeightOf [
	
	"Limit cases"
	self assert: (testParserSimple weightOf: 0) isZero.
	
	self assert: (testParserSimple weightOf: 5) isZero.
	
	"Classical case"
	self assert: (testParserSimple weightOf: 3) equals: 36.31.
]

{ #category : #tests }
TreeParserTest >> testWithoutSpaces [

	self assert: (testParserMultipleChildren withoutSpaces at: 6) equals: '--6.86%--arch_do_signal_or_restart'
]

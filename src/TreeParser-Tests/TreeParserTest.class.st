Class {
	#name : #TreeParserTest,
	#superclass : #TestCase,
	#instVars : [
		'memoryFS',
		'fileSimple',
		'fileSamePercentage',
		'fileMultipleChildren',
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
	testNodeSimple := TreeParser fromFile: fileSimple.
	
	fileSamePercentage := memoryFS / ('perf_stock_same_percentage.txt').
	testNodeSamePercentage := TreeParser fromFile: fileSamePercentage.
	
	fileMultipleChildren := memoryFS / ('perf_stock_multiple_children.txt').
	testNodeMultipleChildren := TreeParser fromFile: fileMultipleChildren.
	
]

{ #category : #running }
TreeParserTest >> tearDown [

	fileSimple ensureDelete.
	fileSamePercentage ensureDelete.
	fileMultipleChildren ensureDelete.
	super tearDown
]

{ #category : #tests }
TreeParserTest >> testFindChildrenIndexOfIndex [
	"Two cases that shouldn't happen."
	self assert:
		(testNodeSimple findChildrenIndexOfIndex: 0) isZero.
	
	self assert:
		(testNodeSimple findChildrenIndexOfIndex: 5) isZero.
	
	"Case where 2 functions have the same number of spaces."
	self assert:
		(testNodeSimple findChildrenIndexOfIndex: 3) equals: {4} asOrderedCollection.
	
	"Classical case"
	self assert:
		(testNodeSamePercentage findChildrenIndexOfIndex: 5) equals: {6} asOrderedCollection.
	
	"Multiple children"
	self assert:
		(testNodeMultipleChildren findChildrenIndexOfIndex: 3) equals: {4 . 5 . 8} asOrderedCollection.
]

{ #category : #tests }
TreeParserTest >> testFindChildrenOfIndex [

	| aNode |
	aNode := testNodeMultipleChildren findChildrenOfIndex: 3.

	self
		assert: aNode first name
		equals: (testNodeMultipleChildren nameOf: 4).
	self
		assert: aNode second name
		equals: (testNodeMultipleChildren nameOf: 5).
	self
		assert: aNode third name
		equals: (testNodeMultipleChildren nameOf: 8)
]

{ #category : #tests }
TreeParserTest >> testFindChildrenOfRecursive [

	| aNode |
	aNode := testNodeMultipleChildren nodes.
	aNode := aNode firstChildrenOf: 2.

	self
		assert: aNode children second children first name
		equals: (testNodeMultipleChildren nameOf: 6).
	self
		assert: aNode children second children first children first name
		equals: (testNodeMultipleChildren nameOf: 7)
]

{ #category : #tests }
TreeParserTest >> testFindParentIndexOfIndex [
	
	"Two cases that shouldn't happen."
	self assert: (testNodeSimple findParentIndexOfIndex: 0) isZero.
	
	self assert: (testNodeSimple findParentIndexOfIndex: 5) isZero.
	
	"The first doesn't have a parent."
	self assert: (testNodeMultipleChildren findParentIndexOfIndex: 1) isZero.
	
	"Two classical cases."
	self assert: (testNodeMultipleChildren findParentIndexOfIndex: 5) equals: 3.
	
	self assert: (testNodeMultipleChildren findParentIndexOfIndex: 9) equals: 8
]

{ #category : #tests }
TreeParserTest >> testFindParentOfIndex [
	"Two cases that shouldn't happen."

	self assert: (testNodeSimple findParentOfIndex: 0) isNil.

	self assert: (testNodeSimple findParentOfIndex: 5) isNil.

	"The first doesn't have a parent."
	self assert: (testNodeMultipleChildren findParentOfIndex: 1) isNil.

	"Two classical cases."
	self
		assert: (testNodeMultipleChildren findParentOfIndex: 5) name
		equals: (testNodeMultipleChildren nameOf: 3).

	self
		assert: (testNodeMultipleChildren findParentOfIndex: 6) name
		equals: (testNodeMultipleChildren nameOf: 5)
]

{ #category : #tests }
TreeParserTest >> testFindParentOfRecursive [

	| aNode |
	aNode := testNodeMultipleChildren nodes.
	aNode := aNode firstChildrenOf: 2.

	self
		assert: aNode parent name
		equals: (testNodeMultipleChildren nameOf: 2).

	self
		assert:
		(testNodeMultipleChildren findParentOfIndex: 2) children first name
		equals: (testNodeMultipleChildren findParentOfIndex: 3) name
]

{ #category : #tests }
TreeParserTest >> testIsLeaf [

	| family example |
	family := testNodeSimple nodes.
	example := (family firstChildrenOf: 2).
	
	self assert: example isLeaf not.
	self assert: example isNotLeaf.
	
	self assert: example children first isLeaf.
	self assert: example children first isNotLeaf not.
]

{ #category : #tests }
TreeParserTest >> testNameOf [

	"Limit cases"
	self assert: (testNodeSimple nameOf: 0) isNil.
	
	self assert: (testNodeSimple nameOf: 5) isNil.

	"Three cases where the parsing is different."
	self assert: (testNodeSimple nameOf: 1) equals: 'entry_SYSCALL_64_after_hwframe'.

	self assert: (testNodeSamePercentage nameOf: 4) equals: '__x64_sys_read'.
	
	self assert: (testNodeSamePercentage nameOf: 6) equals: 'vfs_read'
]

{ #category : #tests }
TreeParserTest >> testNodes [
	
	| family example |
	family := testNodeMultipleChildren nodes.
	example := (family firstChildrenOf: 2) children.
	
	self assert: example first name equals: '__x64_sys_read'.
	
	self assert: example second name equals: 'syscall_exit_to_user_mode'.
	
	self assert: example third name equals: '__x64_sys_openat'.
	
]

{ #category : #tests }
TreeParserTest >> testNodesSameParent [
	
	| family example |
	family := testNodeMultipleChildren nodes.
	example := (family firstChildrenOf: 2) children.
	
	self assert: family children first children first equals: example first parent.
	
	self assert: example first parent equals: example second parent
]

{ #category : #tests }
TreeParserTest >> testNumberOfFunctions [

	self assert: (testNodeSimple numberOfFunctions) equals: 4
]

{ #category : #tests }
TreeParserTest >> testNumberOfSpacesAt [

	
	self assert: (testNodeSimple numberOfSpacesAt: 0) isZero.
	
	self assert: (testNodeSimple numberOfSpacesAt: 5) isZero.

	self assert: (testNodeSimple numberOfSpacesAt: 1) equals: 4
]

{ #category : #tests }
TreeParserTest >> testPercentageOf [
	"Limit cases"

	self assert: (testNodeSimple percentageOf: 0) isZero.

	self assert: (testNodeSimple percentageOf: 5) isZero.

	"Cases with 4 digits."
	self assert: (testNodeSimple percentageOf: 3) equals: 45.91.

	self assert: (testNodeSimple percentageOf: 1) equals: 46.02.


	"Case with 3 digits."
	self assert: (testNodeMultipleChildren percentageOf: 8) equals: 0.53.

	"Case with same percentage"
	self
		assert: (testNodeSamePercentage percentageOf: 4)
		equals: (testNodeSamePercentage percentageOf: 5)
]

{ #category : #tests }
TreeParserTest >> testReadLine [

	"Limit cases."
	self assert: (testNodeSimple readLine: 0) isNil.
	
	self assert: (testNodeSimple readLine: 5) isNil.

	self assert: (testNodeSimple readLine: 3) equals: '                --45.91%--do_syscall_64'
]

{ #category : #tests }
TreeParserTest >> testRealPercentageOf [

	"Limit cases."
	self assert: (testNodeSimple realPercentageOf: 0) isZero.

	self assert: (testNodeSimple realPercentageOf: 5) isZero.

	self
		assert: (testNodeSamePercentage realPercentageOf: 3)
		equals: 9.13.

	self assert: (testNodeSamePercentage realPercentageOf: 4) equals: 0.0
]

{ #category : #tests }
TreeParserTest >> testTime [
	
	self assert: testNodeSimple time equals: 397.0.
	
	self assert: testNodeSimple nodes time equals: 397.0.
]

{ #category : #tests }
TreeParserTest >> testTraces [

	| family traces |
	family := testNodeSimple nodes.
	traces := family traces.

	self assert: traces size equals: 1.
	
	self assert: traces first name equals: '__x64_sys_read'.
	
	self assert: traces first weight equals: 146.02.
]

{ #category : #tests }
TreeParserTest >> testWeight [
	
	| family example |
	family := testNodeMultipleChildren nodes.
	example := family firstChildrenOf: 2.
	
	self assert: example weight equals: 6.83.
]

{ #category : #tests }
TreeParserTest >> testWeightOf [
	
	"Limit cases"
	self assert: (testNodeSimple weightOf: 0) isZero.
	
	self assert: (testNodeSimple weightOf: 5) isZero.
	
	"Classical case"
	self assert: (testNodeSimple weightOf: 3) equals: 36.25.
]

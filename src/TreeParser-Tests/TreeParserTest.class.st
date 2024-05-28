Class {
	#name : #TreeParserTest,
	#superclass : #TestCase,
	#instVars : [
		'memoryFS',
		'fileSimple',
		'fileSamePercentage',
		'fileMultipleChildren',
		'treeSimple',
		'treeSamePercentage',
		'treeMultipleChildren',
		'testNodeSimple',
		'testNodeSamePercentage',
		'testNodeMultipleChildren'
	],
	#category : #'TreeParser-Tests'
}

{ #category : #running }
TreeParserTest >> setUp [

	super setUp.
	memoryFS := FileSystem memory.
	memoryFS / ('perf_stock_simple.txt') writeStreamDo: [:stream | stream nextPutAll: '# To display the perf.data header info, please use --header/--header-only options.
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

	memoryFS / ('perf_stock_same_percentage.txt') writeStreamDo: [:stream | stream nextPutAll: '# To display the perf.data header info, please use --header/--header-only options.
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

	memoryFS / ('perf_stock_multiple_children.txt') writeStreamDo: [:stream | stream nextPutAll: '# To display the perf.data header info, please use --header/--header-only options.
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
	treeSimple := TreeParse fromFile: fileSimple.
	testNodeSimple := treeSimple asNodes.
	
	fileSamePercentage := memoryFS / ('perf_stock_same_percentage.txt').
	treeSamePercentage := TreeParse fromFile: fileSamePercentage.
	testNodeSamePercentage := treeSamePercentage asNodes.
	
	fileMultipleChildren := memoryFS / ('perf_stock_multiple_children.txt').
	treeMultipleChildren := TreeParse fromFile: fileMultipleChildren.
	testNodeMultipleChildren := treeMultipleChildren asNodes.
	
]

{ #category : #running }
TreeParserTest >> tearDown [

	fileSimple ensureDelete.
	fileSamePercentage ensureDelete.
	fileMultipleChildren ensureDelete.
	super tearDown
]

{ #category : #tests }
TreeParserTest >> testClassify [
	
	| family example |
	family := testNodeMultipleChildren classify.
	example := (family firstChildrenOf: 2) children.
	
	self assert: example size equals: 3.
	
	self assert: example first name equals: '__x64_sys_read'.
	
	self assert: example second name equals: 'syscall_exit_to_user_mode'.
	
	self assert: example third name equals: '__x64_sys_openat'.
	
	self assert: example first parent equals: example second parent
]

{ #category : #tests }
TreeParserTest >> testEstimatePercentage [
	
	| family example |
	family := testNodeSamePercentage classify.
	example := family firstChildrenOf: 2.
	
	self assert: example estimatePercentage equals: 9.13.
	
	self assert: example children first estimatePercentage equals: 0.0
]

{ #category : #tests }
TreeParserTest >> testFindChildrenOf [

	self assert:
		(testNodeMultipleChildren findChildrenOf: 3) first equals: 4.
		
	self assert:
		(testNodeMultipleChildren findChildrenOf: 3) second equals: 5.
		
	self assert:
		(testNodeMultipleChildren findChildrenOf: 3) third equals: 8
]

{ #category : #tests }
TreeParserTest >> testFindParentOf [

	self assert: (testNodeMultipleChildren findParentOf: 4) equals: 3.
	
	self assert: (testNodeMultipleChildren findParentOf: 6) equals: 5
]

{ #category : #tests }
TreeParserTest >> testNameOf [

	self assert: (testNodeSimple nameOf: 1) equals: 'entry_SYSCALL_64_after_hwframe'.

	self assert: (testNodeSamePercentage nameOf: 4) equals: '__x64_sys_read'.
	
	self assert: (testNodeSamePercentage nameOf: 6) equals: 'vfs_read'
]

{ #category : #tests }
TreeParserTest >> testNumberOfFunctions [

	self assert: (testNodeSimple numberOfFunctions) equals: 4
]

{ #category : #tests }
TreeParserTest >> testNumberOfSpaces [

	self assert: (testNodeSimple numberOfSpacesAt: 1) equals: 4
]

{ #category : #tests }
TreeParserTest >> testReadALine [

	self assert: (treeSimple readLine: 3) equals: '            ---entry_SYSCALL_64_after_hwframe'
]

{ #category : #tests }
TreeParserTest >> testSimplePercentageOf [

	self assert: (testNodeSimple percentageOf: 3) equals: 45.91
]

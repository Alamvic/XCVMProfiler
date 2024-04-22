Class {
	#name : #TreeParserTest,
	#superclass : #TestCase,
	#instVars : [
		'memoryFS',
		'file',
		'tree',
		'testNodes'
	],
	#category : #'TreeParser-Tests'
}

{ #category : #running }
TreeParserTest >> setUp [
	super setUp.
	memoryFS := FileSystem memory.
	memoryFS / ('perf_stock_tree.txt') writeStreamDo: [:stream | stream nextPutAll: '# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 1K of event cycles:P
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
                          |                      --36.26%--generic_file_read_iter
                          |                                |          
                          |                                 --36.16%--filemap_read
                          |                                           |          
                          |                                           |--34.21%--copy_page_to_iter
                          |                                           |          |          
                          |                                           |          |--29.53%--rep_movs_alternative
                          |                                           |          |          |          
                          |                                           |          |           --22.35%--asm_exc_page_fault
                          |                                           |          |                     exc_page_fault
                          |                                           |          |                     |          
                          |                                           |          |                      --21.76%--do_user_addr_fault
                          |                                           |          |                                |          
                          |                                           |          |                                 --20.80%--handle_mm_fault
                          |                                           |          |                                           |          
                          |                                           |          |                                            --19.63%--__handle_mm_fault
                          |                                           |          |                                                      |          
                          |                                           |          |                                                       --18.78%--handle_pte_fault
                          |                                           |          |                                                                 |          
                          |                                           |          |                                                                  --16.57%--do_anonymous_page
                          |                                           |          |                                                                            |          
                          |                                           |          |                                                                            |--6.01%--alloc_anon_folio
                          |                                           |          |                                                                            |          |          
                          |                                           |          |                                                                            |           --5.92%--vma_alloc_folio
                          |                                           |          |                                                                            |                     |          
                          |                                           |          |                                                                            |                      --5.42%--alloc_pages_mpol
                          |                                           |          |                                                                            |                                |          
                          |                                           |          |                                                                            |                                 --5.03%--__alloc_pages
                          |                                           |          |                                                                            |                                           |          
                          |                                           |          |                                                                            |                                            --4.35%--get_page_from_freelist
                          |                                           |          |                                                                            |                                                      |          
                          |                                           |          |                                                                            |                                                      |--3.18%--clear_page_rep
                          |                                           |          |                                                                            |                                                      |          
                          |                                           |          |                                                                            |                                                       --0.88%--rmqueue
                          |                                           |          |                                                                            |                                                                 |          
                          |                                           |          |                                                                            |                                                                  --0.58%--__rmqueue_pcplist
                          |                                           |          |                                                                            |          
                          |                                           |          |                                                                            |--2.65%--folio_add_lru_vma
                          |                                           |          |                                                                            |          folio_add_lru
                          |                                           |          |                                                                            |          |          
                          |                                           |          |                                                                            |           --2.46%--folio_batch_move_lru
                          |                                           |          |                                                                            |                     |          
                          |                                           |          |                                                                            |                      --1.77%--lru_add_fn
                          |                                           |          |                                                                            |                                |          
                          |                                           |          |                                                                            |                                 --1.08%--lru_gen_add_folio
                          |                                           |          |                                                                            |                                           |          
                          |                                           |          |                                                                            |                                            --0.65%--__mod_lruvec_state
                          |                                           |          |                                                                            |          
                          |                                           |          |                                                                            |--1.74%--folio_add_new_anon_rmap
                          |                                           |          |                                                                            |          |          
                          |                                           |          |                                                                            |           --1.18%--__lruvec_stat_mod_folio
                          |                                           |          |                                                                            |                     |          
                          |                                           |          |                                                                            |                      --0.69%--__mod_lruvec_state
                          |                                           |          |                                                                            |          
                          |                                           |          |                                                                            |--1.67%--__mem_cgroup_charge
                          |                                           |          |                                                                            |          
                          |                                           |          |                                                                            |--0.94%--__folio_throttle_swaprate
                          |                                           |          |                                                                            |          |          
                          |                                           |          |                                                                            |           --0.58%--blk_cgroup_congested
                          |                                           |          |                                                                            |          
                          |                                           |          |                                                                             --0.78%--__pte_offset_map_lock
                          |                                           |          |          
                          |                                           |           --3.80%--asm_exc_page_fault
                          |                                           |          
                          |                                            --1.66%--filemap_get_pages
                          |                                                      filemap_get_read_batch
                          |          
                          |--6.88%--syscall_exit_to_user_mode
                          |          |          
                          |           --6.86%--arch_do_signal_or_restart
                          |                     |          
                          |                      --6.86%--get_signal
                          |                                |          
                          |                                 --6.86%--do_group_exit
                          |                                           do_exit
                          |                                           |          
                          |                                            --6.76%--exit_mm
                          |                                                      mmput
                          |                                                      __mmput
                          |                                                      exit_mmap
                          |                                                      |          
                          |                                                       --6.66%--unmap_vmas
                          |                                                                 unmap_single_vma
                          |                                                                 unmap_page_range
                          |                                                                 |          
                          |                                                                  --6.65%--zap_pmd_range.isra.0
                          |                                                                            |          
                          |                                                                             --6.51%--zap_pte_range
                          |                                                                                       |          
                          |                                                                                       |--3.99%--tlb_flush_mmu
                          |                                                                                       |          tlb_batch_pages_flush
                          |                                                                                       |          |          
                          |                                                                                       |           --3.91%--free_pages_and_swap_cache
                          |                                                                                       |                     |          
                          |                                                                                       |                      --3.82%--release_pages
                          |                                                                                       |                                |          
                          |                                                                                       |                                |--1.59%--lru_gen_del_folio.constprop.0
                          |                                                                                       |                                |          
                          |                                                                                       |                                |--1.37%--free_unref_page_list
                          |                                                                                       |                                |          |          
                          |                                                                                       |                                |           --1.17%--free_unref_page_commit
                          |                                                                                       |                                |                     |          
                          |                                                                                       |                                |                      --1.07%--free_pcppages_bulk
                          |                                                                                       |                                |                                |          
                          |                                                                                       |                                |                                 --0.78%--__free_one_page
                          |                                                                                       |                                |          
                          |                                                                                       |                                 --0.68%--__mem_cgroup_uncharge_list
                          |                                                                                       |          
                          |                                                                                        --1.90%--folio_remove_rmap_ptes
                          |                                                                                                  |          
                          |                                                                                                   --0.91%--__lruvec_stat_mod_folio
                          |                                                                                                             |          
                          |                                                                                                              --0.68%--__mod_lruvec_state
                          |          
                           --0.53%--__x64_sys_openat
                                     do_sys_openat2
'].

	file := memoryFS / ('perf_stock_tree.txt').
	tree := TreeParse fromFile: file.
	testNodes := tree asNodes.
]

{ #category : #running }
TreeParserTest >> tearDown [ 

	file ensureDelete.
	super tearDown.
]

{ #category : #tests }
TreeParserTest >> testFindParentFrom [
	self assert: ((testNodes findParentFrom: 6) sameAs: '--45.91%--do_syscall_64').
	self assert: ((testNodes findParentFrom: 27) sameAs: '--16.57%--do_anonymous_page')
]

{ #category : #tests }
TreeParserTest >> testLastNodeOf [
	self assert: ((testNodes lastNodeOf: 1) sameAs: (testNodes nodes at: 26))
]

{ #category : #tests }
TreeParserTest >> testNameOf [
	self assert: ((testNodes nameOf: 4) sameAs: '__x64_sys_read').
	self assert: ((testNodes nameOf: 6) sameAs: 'vfs_read' )
]

{ #category : #tests }
TreeParserTest >> testNumberOfFunctions [
	self assert: (testNodes numberOfFunctions) equals: 71.
]

{ #category : #tests }
TreeParserTest >> testNumberOfNodes [
	"self assert: (testNodes numberOfNodes) equals: 57."
]

{ #category : #tests }
TreeParserTest >> testNumberOfSpaces [
	self assert: (testNodes numberOfSpacesAt: 1) equals: 4.
]

{ #category : #tests }
TreeParserTest >> testPercentageOf [
	self assert: (testNodes percentageOf: 3) equals: 45.91
]

{ #category : #tests }
TreeParserTest >> testReadALine [
	self assert: ((tree readLine: 3) sameAs: '            ---entry_SYSCALL_64_after_hwframe').
]

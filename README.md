# XCVMProfiler
VM Profiler based on [instruments](https://help.apple.com/instruments/mac/current/#/dev7b09c84f5) and [perf](https://perf.wiki.kernel.org/)

## Instruments 🍎
### Install
```smalltalk
Metacello new
  baseline: 'XCTrace';
  repository: 'github://Alamvic/XCVMProfiler:main/src';
  load.
```

### How to use
```smalltalk
fr := (FileLocator home / 'path/to/XCVMProfiler/resources/test-profile.trace') asFileReference.
"To get the XML data"
tree := XCTraceTree fromTimeProfileFileReference: fr.
samples := tree samples.

"To directly get the different classified profiles"
primitiveProfiles := (XCVMDifferentialPrimitiveProfiler onFiles: {fr}) profiles.
profiles := (XCVMDifferentialProfiler onFiles: {fr}) profiles.
```
---
## perf 🐧
### Install
```smalltalk
Metacello new
  baseline: 'PerfTreeParser';
  repository: 'github://Alamvic/XCVMProfiler:main/src';
  load.
```

### How to use
#### For perf
You need to use these parameters in order for the parser to work as intended:
```console
sudo perf record -a -g --call-graph=dwarf -- ./script.sh
sudo perf report --header --call-graph=callee --stdio > perf_example.txt
```

#### For Pharo
```smalltalk
fr := (FileLocator home / 'path/to/XCVMProfiler/resources/perf_stock_multiple_children.txt') asFileReference.

"Use `parseFile:` to directly get the head of the node with all the parsing done"
node := PerfTreeParser parseFile: fr.

"To get the traces of the nodes:"
traces := node traces.

"You can use `fromFile:` if you want to play with the parser"
parser := PerfTreeParser fromFile: fr
```
traces := node traces.

"You can use `fromFile:` if you want to play with the parser"
parser := PerfTreeParser fromFile: fr
```

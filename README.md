# XCVMProfiler
VM Profiler based on [instruments](https://help.apple.com/instruments/mac/current/#/dev7b09c84f5) and [perf](https://perf.wiki.kernel.org/)

## Install
```smalltalk
Metacello new
  baseline: 'PerfTreeParser';
  repository: 'github://Alamvic/XCVMProfiler/src';
  load.


Metacello new
  baseline: 'XCTrace';
  repository: 'github://Alamvic/XCVMProfiler/src';
  load.
```

## Example of use
### Perf parser
```smalltalk
fr := (FileLocator home / 'path/to/XCVMProfiler/resources/perf_stock_multiple_children.txt') asFileReference.

"Use `parseFile:` to directly get the head of the node with all the parsing done"
node := TreeParser parseFile: fr.

"To get the traces of the nodes:"
traces := node traces.

"You can use `fromFile:` if you want to play with the parser"
parser := TreeParser fromFile: fr
```

### XC parser
```smalltalk
fr := (FileLocator home / 'path/to/XCVMProfiler/resources/test-profile.trace.txt') asFileReference.
"To get the XML data"
tree := XCTraceTree fromTimeProfileFileReference: fr.
samples := tree samples.

"To directly get the different classified profiles"
primitiveProfiles := (XCVMDifferentialPrimitiveProfiler onFiles: {fr}) profiles.
profiles := (XCVMDifferentialProfiler onFiles: {fr}) profiles.
```

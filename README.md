# VMProfiler
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
primitiveProfiles := (VMDifferentialPrimitiveProfiler onFiles: {fr}) profiles.
profiles := (VMDifferentialProfiler onFiles: {fr}) profiles.
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
You need to record the data with these parameters in order for the parser to work as intended:
```console
sudo perf record -a -g --call-graph=dwarf -- ./script.sh
```

* `-a` is to measure performances for all users, it's optional.

* `--call-graph=dwarf` is to organize data as trees.

* `-- ./script.sh` to give the script/commands you want to execute, could also be a command like `sleep 3`.

Then you report it in a `txt` file:
```console
sudo perf report --header --call-graph=callee --stdio > perf_example.txt
```

* `--header` is needed to get the total time of execution.

* `--call-graph=callee` to have the trees with the children at the top of the trees.

* `--percent-limit=0.1` to set the minimal percentage kept in the `txt` file.


#### For Pharo
```smalltalk
fr := (FileLocator home / 'path/to/XCVMProfiler/resources/perf_example_callee_multiple_children.txt') asFileReference.

"Use `parseFile:` to directly get the head of the node with all the parsing done"
node := PerfTreeParser parseFile: fr.

"To get the traces of the nodes:"
traces := node traces.

"To directly get the different classified profiles"
primitiveProfiles := (VMDifferentialPrimitiveProfiler onFiles: {fr}) profiles.
profiles := (VMDifferentialProfiler onFiles: {fr}) profiles.

"You can use `fromFile:` if you want to play with the parser"
parser := PerfTreeParser fromFile: fr
```
---
## Grafana
**[Install instructions for Grafana](https://grafana.com/docs/grafana/latest/setup-grafana/installation/)**

**[Install instructions for PostgreSQL](https://www.postgresql.org/download/)**

The overall documentation is [here](https://grafana.com/docs/grafana/latest/).

It uses [PostgreSQL](https://www.postgresql.org/) which can be used on Pharo with [P3](https://github.com/svenvc/P3) and is documented for Grafana [here](https://grafana.com/docs/grafana/latest/datasources/postgres/).

It works as a daemon and local server which can be accessed through `localhost:3000` by default, the default profile is `admin` with `admin` as password.

To start/stop it:
```console
sudo systemctl start grafana-server
sudo systemctl stop grafana-server
```

To start it when the computer is booting:
```console
sudo systemctl enable grafana-server.service
```


### How to use it with the profiler on Pharo
Template used for the table:
```sql
CREATE TABLE bench (id int, bench_id int, timestamp date, profile varchar(30), value real);
```

Example of use:
```smalltalk
fr := (FileLocator home / 'path/to/XCVMProfiler/resources/perf_stock_multiple_children.txt') asFileReference.

profiles := (VMDifferentialProfiler onFiles: {fr}) table.

exporter := VMBenchSQLExporter fromContent: profiles WithUser: 'username' TableName: 'bench' andTimeStamp: Date today yyyymmdd.

updatedSQLTable := exporter export
```

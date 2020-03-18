#!/bin/bash

function info {

	# TODO: ycsb/worksloads에 접근해서 실제 workload 파일 정보 가져오기
	datadirectory="/vldb/ycsb-rocksdb-data"
	workload="workloada"
	recordcount="15GB"
	operationcount="40GB"
	requestdistribution="zipfian"

	rocksdblogpath="/home/pleiadex/Workplace/log/rocksdb-log"
	
	# print parameters and option values
	echo "Run YSCB"
	echo "Data Directory = $datadirectory"
	echo "Workload Type = $workload"
	echo "Record Count = $recordcount"
	echo "Opertation Count = $operationcount"
	echo "requestdistribution = $requestdistribution" 
	echo "RocksDB Log Path = $rocksdblogpath"
	
}

function run {

		# # Load Data
		./bin/ycsb load rocksdb -s -P workloads/${workload} -p rocksdb.dir=${datadirectory}

		# # Excute iostat on background thread
		iostat 1 -xm /dev/sdb1 &> /home/pleiadex/Workplace/log/${requestdistribution}_updateOnly_iostat &
		# # Run ycsb
		./bin/ycsb run rocksdb -s -P workloads/${workload} -p rocksdb.dir=${datadirectory}

		# # Stop iostat
		echo 1234 | sudo -S killall iostat

		echo "Final data directory stats"
		df -h /vldb/ycsb-rocksdb-data/
}

info
run


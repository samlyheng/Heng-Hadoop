#!/bin/bash

# Start Hadoop services
hdfs namenode -format
$HADOOP_HOME/sbin/start-all.sh
$HADOOP_HOME/bin/mapred --daemon start historyserver

# Keep the container running
tail -f /dev/null


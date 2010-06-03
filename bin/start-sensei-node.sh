#!/usr/bin/env bash

#usage="Usage: start-sensei-node.sh <id> <port> <partitions> <conf-dir>"

# if no args specified, show usage
#if [ $# -le 3 ]; then
#  echo $usage
#  exit 1
#fi

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

lib=$bin/../lib/master
dist=$bin/../dist
resources=$bin/../resources
logs=${bin}/../logs

idx=$bin/../data/cardata

CLASSPATH=$resources:$lib/fastutil.jar:$lib/log4j.jar:$lib/lucene-core.jar:\
$lib/protobuf-java-2.1.0.jar:$lib/bobo-browse-2.5.0-rc1.jar:$lib/kamikaze-2.0.0.jar:$lib/commons-logging.jar:\
$lib/netty-3.1.0.GA.jar:$lib/spring.jar:$lib/scala-library.jar:$lib/zoie-2.0.0-rc3.jar:\
$lib/norbert-java-cluster-1.0-SNAPSHOT.jar:$lib/norbert-java-network-1.0-SNAPSHOT.jar:$lib/norbert-cluster-1.0-SNAPSHOT.jar:$lib/norbert-network-1.0-SNAPSHOT.jar:$lib/zookeeper-3.2.0.jar:$dist/sensei-0.0.1.jar


java -classpath $CLASSPATH -Didx.dir=$idx -Dlog.home=$logs com.sensei.search.nodes.SenseiServer $1 $2 $3 $4

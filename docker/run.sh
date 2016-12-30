#!/bin/sh

if [ "${ZOOKEEPER_SERVERS}" = "" ]; then
	echo "Env variable 'ZOOKEEPER_SERVERS' needed! Ex: -e ZOOKEEPER_SERVERS=127.0.0.1:2181"
	exit
fi

set -x

java -jar /local/bookkeeper-tutorial.jar --zookeeper-servers ${ZOOKEEPER_SERVERS}

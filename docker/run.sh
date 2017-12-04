#!/bin/sh

if [ "${ZOOKEEPER_SERVERS}" = "" ]; then
	echo "Env variable 'ZOOKEEPER_SERVERS' needed! Ex: -e ZOOKEEPER_SERVERS=127.0.0.1:2181"
	exit
fi

# Wait for bookies
if [ ! -z "${BOOKKEEPER_SERVER}" ]; then
    while ! nc -z -w 2 ${BOOKKEEPER_SERVER} 3181; do
        sleep 1
    done
    echo "Connected to bookie: ${BOOKKEEPER_SERVER}"
fi

set -x

java -jar /local/bookkeeper-tutorial.jar --zookeeper-servers ${ZOOKEEPER_SERVERS}

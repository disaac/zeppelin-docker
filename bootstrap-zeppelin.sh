#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# altering the core-site configuration
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

# setting spark defaults
echo spark.yarn.jars hdfs:///spark/*.jar > $SPARK_HOME/conf/spark-defaults.conf
cp $SPARK_HOME/conf/metrics.properties.template $SPARK_HOME/conf/metrics.properties

/etc/init.d/ssh start
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver



CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
    /usr/local/zeppelin/bin/zeppelin-daemon.sh start
    while true; do sleep 1000; done
else
    /bin/bash -c "$*"
fi
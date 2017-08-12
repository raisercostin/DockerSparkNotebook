echo "35.157.141.95 dbserver" >> /etc/hosts
cd /opt/docker/notebooks
rm -rf *
cp /opt/DockerSparkNotebook/notebooks/*.snb .
cd /opt/docker
export EXTRA_CLASSPATH=/jars/opennlp-tools.jar:/jars/spark-cassandra-connector.jar:/jars/graphframes.jar
bin/spark-notebook -Dhttp.port=${SNB_PORT}


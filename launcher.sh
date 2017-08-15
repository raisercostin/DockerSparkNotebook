echo "123.123.123.123 dbserver" >> /etc/hosts
cd /opt/docker/notebooks
rm -rf *
cp /opt/DockerSparkNotebook/notebooks/*.snb.ipynb .
cd /opt/docker
export EXTRA_CLASSPATH=/jars/opennlp-tools.jar:/jars/spark-cassandra-connector.jar:/jars/graphframes.jar
bin/spark-notebook -Dhttp.port=${SNB_PORT}


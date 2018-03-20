echo "444.444.444.444 dbserver" >> /etc/hosts
cd /opt/SparkDatasets
nc -w 1 -z github.com 80 &>/dev/null && git pull
cd /opt/DockerSparkNotebook
nc -w 1 -z github.com 80 &>/dev/null && git pull
cd /opt/docker/notebooks
rm -rf *
cp /opt/DockerSparkNotebook/notebooks/*.snb.ipynb .
cd /opt/docker
export EXTRA_CLASSPATH=/jars/unpacked
bin/spark-notebook -Dhttp.port=${SNB_PORT}


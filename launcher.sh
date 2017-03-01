cd /opt/docker/notebooks
rm -rf *
cp /opt/SparkNotebooks/*.snb .
cd /opt/docker
bin/spark-notebook -Dhttp.port=${SNB_PORT}


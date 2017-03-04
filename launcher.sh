cd /opt/docker/notebooks
rm -rf *
cp /opt/DockerSparkNotebook/notebooks/*.snb .
cd /opt/docker
bin/spark-notebook -Dhttp.port=${SNB_PORT}


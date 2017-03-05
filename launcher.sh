echo "35.157.141.95 dbserver" >> /etc/hosts
cp /jars/*.jar /opt/docker/lib/
cd /opt/docker/notebooks
rm -rf *
cp /opt/DockerSparkNotebook/notebooks/*.snb .
cd /opt/docker
bin/spark-notebook -Dhttp.port=${SNB_PORT}


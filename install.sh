export DEBIAN_FRONTEND=noninteractive
apt-get -qqy purge openjdk-7-jdk openjdk-7-jre-headless
apt-get -qq update
apt-get -qqy install --no-install-recommends                             \
  wget curl git vim jq mc net-tools less ca-certificates build-essential
echo 'Downloading JDK ...'
wget --no-check-certificate --no-cookies                         \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     -qO /opt/jdk.tgz                                            \
         http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz
echo 'Extracting JDK ...'
tar -xf /opt/jdk.tgz -C /opt
rm /opt/jdk.tgz
mv /opt/jdk1.8.0_102 /opt/jdk
echo 'Downloading Spark-Cassandra Connector ...'
wget -qO /opt/docker/lib/spark-cassandra-connector.jar \
         https://repo1.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.11/2.0.0-RC1/spark-cassandra-connector_2.11-2.0.0-RC1.jar
echo 'Downloading SparkNotebooks ...'
cd /opt
git clone https://github.com/dserban/DockerSparkNotebook
git clone https://github.com/dserban/SparkDatasets
echo 'Building container, this may take a while ...'


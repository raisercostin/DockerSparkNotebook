export DEBIAN_FRONTEND=noninteractive
apt-get -qqy purge \
  openjdk-7-jdk openjdk-7-jre-headless openjdk-8-jdk openjdk-8-jdk-headless openjdk-8-jre openjdk-8-jre-headless
apt-get -qq update
apt-get -qqy install --no-install-recommends \
  wget curl git vim jq mc net-tools less ca-certificates netcat-traditional build-essential
echo 'Downloading JDK ...'
wget --no-check-certificate --no-cookies                         \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     -qO /opt/jdk.tgz                                            \
         http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.tar.gz
echo 'Extracting JDK ...'
tar -xf /opt/jdk.tgz -C /opt
rm /opt/jdk.tgz
mv /opt/jdk* /opt/jdk
mkdir -p /jars/unpacked
echo 'Downloading spark-sql-kafka ...'
wget -qO /jars/spark-sql-kafka.jar https://dserban.github.io/jars/spark-sql-kafka.jar
echo 'Downloading kafka-clients ...'
wget -qO /jars/kafka-clients.jar https://dserban.github.io/jars/kafka-clients.jar
echo 'Downloading spark-xml ...'
wget -qO /jars/spark-xml.jar https://dserban.github.io/jars/spark-xml.jar
echo 'Downloading json4s-native ...'
wget -qO /jars/json4s-native.jar https://dserban.github.io/jars/json4s-native.jar
echo 'Downloading opennlp-tools ...'
wget -qO /jars/opennlp-tools.jar https://dserban.github.io/jars/opennlp-tools.jar
echo 'Downloading graphframes ...'
wget -qO /jars/graphframes.jar https://dserban.github.io/jars/graphframes.jar
echo 'Downloading Spark-Cassandra Connector ...'
wget -qO /jars/spark-cassandra-connector.jar https://dserban.github.io/jars/spark-cassandra-connector.jar
echo 'Downloading jsr166e ...'
wget -qO /jars/jsr166e.jar https://dserban.github.io/jars/jsr166e.jar
echo 'Downloading DockerSparkNotebook/SparkDatasets ...'
cd /jars/unpacked
for fjar in /jars/*.jar
do
  /opt/jdk/bin/jar -xf ${fjar}
done
cd /opt
git clone https://github.com/dserban/DockerSparkNotebook
git clone https://github.com/dserban/SparkDatasets
echo 'Building container, this may take a while ...'

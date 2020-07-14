service ssh start
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
echo "export VISIBLE=now" >> /etc/profile
echo "export JAVA_HOME=/usr/local/openjdk-8" >> ~/.bashrc
source ~/.bashrc

/usr/local/hadoop/sbin/start-dfs.sh

/usr/local/hadoop/sbin/start-yarn.sh

/usr/local/hadoop/bin/hdfs dfs -mkdir /data

/usr/local/hadoop/bin/hdfs dfs -chmod -R a+rwX /

tail -f /usr/local/hadoop/logs/*.out
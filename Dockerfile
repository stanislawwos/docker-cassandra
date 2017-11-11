FROM oberthur/docker-cassandra:2.1.15_2

# ExtendedPasswordAuthenticator
RUN     curl -L "https://github.com/oberthur/cassandra-ext/releases/download/20170323/cassandra-ext-2.1-20170123.jar" > /usr/share/cassandra/lib/cassandra-ext-2.0-20170123.jar

ENTRYPOINT ["/docker-entrypoint.sh", "cassandra", "-f"]

VOLUME ["/etc/cassandra", "/var/lib/cassandra/data", "/var/lib/cassandra/commitlog", "/var/log/cassandra"]

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160

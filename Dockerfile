FROM oberthur/docker-ubuntu-java:jdk8_8.92.14

# explicitly set user/group IDs
RUN groupadd -r cassandra --gid=999 && useradd -r -g cassandra --uid=999 cassandra

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.9
RUN set -x \
        && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
        && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
        && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
        && export GNUPGHOME="$(mktemp -d)" \
        && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
        && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
        && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
        && chmod +x /usr/local/bin/gosu \
        && gosu nobody true \
        && apt-get purge -y --auto-remove ca-certificates wget

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 514A2AD631A57A16DD0047EC749D6EEC0353B12C

ENV CASSANDRA_VERSION 2.1.15

RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list \
    && curl -L http://debian.datastax.com/debian/repo_key | apt-key add - \
    && echo "deb http://pl.archive.ubuntu.com/ubuntu/ wily main universe" | tee -a /etc/apt/sources.list.d/python-support.list \
    && apt-get update \
    && apt-get install --assume-yes \
        python python-support \
        dsc21=${CASSANDRA_VERSION}-1 cassandra=${CASSANDRA_VERSION} \
        cassandra-tools=${CASSANDRA_VERSION} \
    && service cassandra stop && rm -rf /var/lib/cassandra/data && rm -rf /var/lib/cassandra/commit_log \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

ENV CASSANDRA_CONFIG /etc/cassandra

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh", "cassandra", "-f"]

RUN mkdir -p /var/lib/cassandra "$CASSANDRA_CONFIG" \
        && chown -R cassandra:cassandra /var/lib/cassandra "$CASSANDRA_CONFIG" \
        && chmod 777 /var/lib/cassandra "$CASSANDRA_CONFIG"

VOLUME ["/etc/cassandra", "/var/lib/cassandra/data", "/var/lib/cassandra/commitlog", "/var/log/cassandra"]

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160

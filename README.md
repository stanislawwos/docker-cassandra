# Docker image containing Cassandra Server

Environment variables may be used to customize/override cassandra default properties. `ENV` vars should be passed when running container.
Alternatively, `EXTERNAL_CONFIGURATION: "true"` can be set to skip any customizations. You may want to set this when `/etc/cassandra` is mounted as an external volume.

Below you can find a list of available variables and corresponding properties.

### `cassandra.yaml`
**`CASSANDRA_CLUSTER_NAME`** - The name of the cluster ([`cluster_name`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__cluster_name))

**`CASSANDRA_LISTEN_ADDRESS`** - The IP address or hostname that Cassandra binds to for connecting to other Cassandra nodes ([`listen_address`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__listen_address))

**`CASSANDRA_ENDPOINT_SNITCH`** - A class used for locating nodes and routing requests ([`endpoint_snitch`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__endpoint_snitch)).
If set to `GossipingPropertyFileSnitch`, the following variables can be used to specify `dc` and `rack` in `cassandra-rackdc.properties` file:
  - *`CASSANDRA_DC`*
  - *`CASSANDRA_RACK`*  

**`CASSANDRA_RPC_ADDRESS`** - The listen address for client connections (Thrift RPC service and native transport) ([`rpc_address`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__rpc_address))

**`CASSANDRA_SEEDS`** - A comma-delimited list of IP addresses used by gossip for bootstrapping new nodes joining a cluster ([`seeds`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__seed_provider))

**`CASSANDRA_COMMITLOG_TOTAL`** - Total space used for commitlogs ([`commitlog_total_space_in_mb`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__commitlog_total_space_in_mb))

**`CASSANDRA_BROADCAST_ADDRESS`** - The IP address a node tells other nodes in the cluster to contact it by ([`broadcast_address`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__broadcast_address))

**`CASSANDRA_NUM_TOKENS`** - Defines the number of tokens randomly assigned to this node on the ring when using _vnodes_ ([`num_tokens`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__num_tokens))

**`CASSANDRA_BROADCAST_RPC_ADDRESS`** - RPC address to broadcast to drivers and other Cassandra nodes ([`broadcast_rpc_address`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__broadcast_rpc_address))

**`CASSANDRA_START_RPC`** - Controls start of the Thrift RPC server ([`start_rpc`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__start_rpc))

**`CASSANDRA_AUTHENTICATOR`** - The authentication backend ([`authenticator`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__authenticator)):
  - `AllowAllAuthenticator` (default)
  - `PasswordAuthenticator`  
  - `SecurityPasswordAuthenticator` (extension to standard `PasswordAuthenticator` - logs authentication attempts to standard log, requires [`SecurityCassandraRoleManager`](#CASSANDRA_ROLE_MANAGER))

**`CASSANDRA_AUTHORIZER`** - The authorization backend ([`authorizer`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__authorizer)):
  - `AllowAllAuthorizer` (default)
  - `CassandraAuthorizer` 
  
**`CASSANDRA_ROLE_MANAGER`** - Part of the Authentication & Authorization backend ([`role_manager`](https://docs.datastax.com/en/cassandra/3.0/cassandra/configuration/configCassandra_yaml.html#configCassandra_yaml__role_manager)):
  - `CassandraRoleManager` (default)
  - `SecurityCassandraRoleManager`  

### `cassandra-env.sh`
**`MAX_HEAP_SIZE`** - Sets the maximum heap size for the JVM ([`MAX_HEAP_SIZE`](http://docs.datastax.com/en/cassandra/3.0/cassandra/operations/opsTuneJVM.html#opsTuneJVM__tuning-the-java-heap))

**`HEAP_NEWSIZE`** - The size of the young generation ([`HEAP_NEWSIZE`](http://docs.datastax.com/en/cassandra/3.0/cassandra/operations/opsTuneJVM.html#opsTuneJVM__heap-sizing-options))

**`JMX_PORT`** - The JMX listen port ([`JMX_PORT`](http://docs.datastax.com/en/cassandra/3.0/cassandra/operations/opsTuneJVM.html#opsTuneJVM__jmx-options))

**`LOCAL_JMX`** - By default Cassandra ships with JMX accessible *only* from localhost. To enable remote JMX connections set `LOCAL_JMX: "no"`. You may want to set additional Java properties, e.g. `com.sun.management.jmxremote.authenticate`,  `java.rmi.server.hostname`, etc. (see `CUSTOM_JVM_OPTS` for examples).

**`CUSTOM_JVM_OPTS`** - Additional parameters appended to JVM_OPTS, e.g.:

`CUSTOM_JVM_OPTS: "-Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Djava.rmi.server.hostname=192.168.56.100"`

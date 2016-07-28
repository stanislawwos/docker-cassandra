# Docker image containing Cassandra Server

Environment variables may be used to customize/override cassandra default properties.
ENV vars should be passed when running container
Below you can find a list of available variables and corresponding properties

### `cassandra-rackdc.properties`
- **`CASSANDRA_DC`** - dc name
- **`CASSANDRA_RACK`** - rack name

### `cassandra.yaml`
- **`CASSANDRA_CLUSTER_NAME`** - The name of the cluster ([`cluster_name`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__cluster_name))
- **`CASSANDRA_LISTEN_ADDRESS`** - The IP address or hostname that Cassandra binds to for connecting to other Cassandra nodes ([`listen_address`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__listen_address))
- **`CASSANDRA_ENDPOINT_SNITCH`** - A class used for locating nodes and routing requests ([`endpoint_snitch`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__endpoint_snitch)) If set to `GossipingPropertyFileSnitch`, the following variables can be used to specify `dc` and `rack` in `cassandra-rackdc.properties` file:
  - *`CASSANDRA_DC`*
  - *`CASSANDRA_RACK`*
- **`CASSANDRA_RPC_ADDRESS`** - The listen address for client connections (Thrift RPC service and native transport) ([`rpc_address`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__rpc_address))
- **`CASSANDRA_SEEDS`** - A comma-delimited list of IP addresses used by gossip for bootstrapping new nodes joining a cluster ([`seeds`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__seed_provider))
- **`CASSANDRA_COMMITLOG_TOTAL`** - Total space used for commitlogs ([`commitlog_total_space_in_mb`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__commitlog_total_space_in_mb))
- **`CASSANDRA_BROADCAST_ADDRESS`** - The IP address a node tells other nodes in the cluster to contact it by ([`broadcast_address`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__broadcast_address))
- **`CASSANDRA_NUM_TOKENS`** - Defines the number of tokens randomly assigned to this node on the ring when using _vnodes_ ([`num_tokens`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__num_tokens))
- **`CASSANDRA_BROADCAST_RPC_ADDRESS`** - RPC address to broadcast to drivers and other Cassandra nodes ([`broadcast_rpc_address`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__broadcast_rpc_address))
- **`CASSANDRA_START_RPC`** - Controls start of the Thrift RPC server ([`start_rpc`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__start_rpc))
- **`CASSANDRA_AUTHENTICATOR`** - The authentication backend ([`authenticator`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__authenticator))
- **`CASSANDRA_AUTHORIZER`** -  The authorization backend ([`authorizer`](https://docs.datastax.com/en/cassandra/2.1/cassandra/configuration/configCassandra_yaml_r.html?scroll=reference_ds_qfg_n1r_1k__authorizer))

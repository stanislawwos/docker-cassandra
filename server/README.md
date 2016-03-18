# Docker image containing Cassandra Server

Environment variables may be used to customize/update cassandra default properties.
ENV vars should be passed when running container
Below you can find a list of files with ENV vars

## cassandra-rackdc.properties
- **DC_NAME** - indicated dc name
- **RACK_NAME** - indicated rack name

## address.yaml
- **OPSCENTER_IP** - stomp interface ip address
- **OPSCENTER_USE_SSL** - use ssl flag
- **BROADCAST_ADDRESS** - address to broadcast to other Cassandra nodes

## cassandra.yaml
- **BROADCAST_ADDRESS** - address to broadcast to other Cassandra nodes / the same for address.yaml
- **CLUSTER_NAME** - name of the cluster
- **BROADCAST_RPC** - the address or interface to bind the Thrift RPC service and native transport server to
- **AUTHENTICATOR** - allows to change an authenticator (default: AllowAllAuthenticator)
- **AUTHORIZER** - allows to change an authorizer (default: AllowAllAuthorizer)
- **SEED_1** - sets 1st seed ip address for seed provider 
- **SEED_2** - sets 2nd seed ip address for seed provider (optional)
- **SEED_N** - sets N seed ip address for seed provider (optional)

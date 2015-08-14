Environment variables may be used to customize/update cassandra default properties.
ENV vars should be passed when running container
Below you can find a list of files with ENV vars

cassandra-rackdc.properties:
    DC_NAME            ->  indicated dc name
    RACK_NAME          ->  indicated rack name

address.yaml:
    OPSCENTER_IP       -> stomp interface ip address
    OPSCENTER_USE_SSL  -> use ssl flag
    BROADCAST_ADDRESS  -> address to broadcast to other Cassandra nodes

cassandra.yaml:
    BROADCAST_ADDRESS  -> address to broadcast to other Cassandra nodes / the same for address.yaml
    CLUSTER_NAME       -> name of the cluster
    BROADCAST_RPC      -> the address or interface to bind the Thrift RPC service and native transport server to
    SEED1              -> sets 1st seed ip address for seed provider 
    SEED2              -> sets 2nd seed ip address for seed provider (1st required to be set)
    SEED3              -> sets 3rd seed ip address for seed provider (1st&2nd required to be set)
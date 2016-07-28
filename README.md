# Docker image containing Cassandra Server
Basic Docker image to run Cassandra as user app (999:999)

Perf settings:
- /etc/security/limits.conf
 - app - memlock unlimited
 - app - nofile 80000
 - app - nproc 60000
 - app - as unlimited
- /etc/sysctl.conf
 - vm.max_map_count = 1048575
 - vm.swappiness=1
 - net.ipv4.tcp_fin_timeout = 30
 - net.ipv4.tcp_tw_reuse = 1

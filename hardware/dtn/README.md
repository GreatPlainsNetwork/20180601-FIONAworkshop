# DTN - Data Transfer Node

https://fasterdata.es.net/science-dmz/DTN/


Components for further definition and lab construction (outline idea dump below):

All together:
Network
Processor
Storage
RAM


Network:
Addressing
ipv4 ipv6 dns
-ip a
-set a temporary
-set a permanent

dns 
- caching
- dig and dig -x
- troubleshoot

MTU
- 1500
- >1500
- why?
- test delta with timed rsync

TCP tuning
- fq
- htcp / bbr
- resources and sysctl.d/98-esnet.conf

Latency! 10ms distance with single packet loss can turn 10G -> 1G link.

Monitoring
-SNMP (optic DB output)
-OpenNMS
-rancid
-perfSONAR



-

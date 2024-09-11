
iptables -t nat -F 
iptables -t nat -X REDSOCKS 
iptables -t nat -X DOCKER 
iptables -t nat -X DOCKER-ISOLATION
iptables -t filter -F 
iptables -t filter -X DOCKER 
iptables -t filter -X DOCKER-USER
iptables -t filter -X DOCKER-ISOLATION-STAGE-1
iptables -t filter -X DOCKER-ISOLATION-STAGE-2

iptables -Z PROXY -t nat 
iptables -Z 

iptables -t nat -Z POSTROUTING 
iptables -t nat -Z PREROUTING 
iptables -t nat -Z OUTPUT

iptables-save

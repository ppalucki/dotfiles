
iptables -t nat -F 
iptables -t nat -X REDSOCKS 
iptables -t nat -X DOCKER 
iptables -t nat -X DOCKER-ISOLATION
iptables -t filter -F 

iptables -Z PROXY -t nat 
iptables -Z 

iptables -t nat -Z POSTROUTING 
iptables -t nat -Z PREROUTING 
iptables -t nat -Z OUTPUT

iptables-save

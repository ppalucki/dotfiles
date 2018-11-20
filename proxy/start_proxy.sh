#!/bin/sh

set -x

### one -time
# echo "net.ipv4.conf.all.route_localnet=1" >>/etc/sysctl.conf
# # sysctl -w net.ipv4.conf.all.route_localnet=1
# # sysctl -p
# sc-restart docker
sysctl -n net.ipv4.conf.all.route_localnet=0
sysctl -n net.ipv4.conf.docker0.route_localnet=1

### -------------------  NAT ------------------------------------
#Creating Chain for transparency rules and adding for flow chains (output and "routing")
iptables -N REDSOCKS -t nat
iptables -I OUTPUT -t nat -j REDSOCKS # required by process that eg. VMs or local wget without http_proxy set
iptables -I PREROUTING -t nat -j REDSOCKS # required by eg. docker

### --------------------- REDSOCKS chain -----------------------------
# subnet=$(wget http://autoproxy.intel.com/ -O- | ./proxynet)
# for subnet in $subnet; do
#     iptables -A REDSOCKS -t nat -d $subnet -j RETURN
# done
# Return if LAN forward to proxy for http (on proxy-mu ip)/https
iptables -A REDSOCKS -t nat -d 127.0.0.1/32 -j RETURN
iptables -A REDSOCKS -t nat -d 10.0.0.0/8 -j RETURN
iptables -A REDSOCKS -t nat -d 10.91.126.91/32 -j RETURN
iptables -A REDSOCKS -t nat -d 172.17.0.0/16 -j RETURN # coreos-kubernetes
iptables -A REDSOCKS -t nat -d 10.4.0.0/16 -j RETURN # tectonic
iptables -A REDSOCKS -t nat -d 10.217.247.236/32 -j RETURN # proxy-mu
iptables -A REDSOCKS -t nat -d 163.33.0.0/16 -j RETURN # proxy-chain and teamforge
iptables -A REDSOCKS -t nat -d 127.0.0.1 -j RETURN # some services (like rabbitmq) need this:
iptables -A REDSOCKS -t nat -d 192.168.0.0/16 -j RETURN # libvirt
# iptables -A REDSOCKS -t nat -d 192.168.99.0/24 -j RETURN # minikube on top of virtulbox 
iptables -A REDSOCKS -t nat -d 100.64.0.0/10 -j RETURN # lab
iptables -A REDSOCKS -t nat -d 100.127.251.0/24 -j RETURN # lab

### ESSENTIAL CODE HERE!!!
# everything trhough redsocks !!!
## SIMPLER VERSIONE
iptables -A REDSOCKS -t nat -p tcp -m tcp -j DNAT --to-destination 127.0.0.1:1080
# iptables -A REDSOCKS -t nat -p udp -m udp -j DNAT --to-destination 127.0.0.1:1080


# iptables -t filter -I INPUT -p tcp -m tcp --dport 1080 -j ACCEPT
# iptables -t filter -I FORWARD -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT
# iptables -t filter -I FORWARD -p tcp -m tcp --dport 1080 -m conntrack --ctstate NEW -j ACCEPT
# iptables -t filter -I FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 

## SECURED VERSION
# # http without redsocks (proxy-mu.intel.com)
# iptables -A REDSOCKS -t nat -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.217.247.236:1080
# # https -> redsocks
# iptables -A REDSOCKS -t nat -p tcp -m tcp --dport 443 -j DNAT --to-destination 127.0.0.1:1080
# # ssh -> redsocks
# iptables -A REDSOCKS -t nat -p tcp -m tcp --dport 22 -j DNAT --to-destination 127.0.0.1:1080

## redirect everything else
# iptables -A REDSOCKS -t nat -p tcp -m tcp -j DNAT --to-destination 127.0.0.1:1080
## sourcegraph binnary gada po rpc do serweera
#iptables -A REDSOCKS -t nat -p tcp -m tcp --dport 3100 -j DNAT --to-destination 127.0.0.1:6000

### ------------------- FILTER --------------------------------
#adding filter rules for transock_ev, dns, http_proxy and packets that are allready accepted for "routing"
### TEST:

#service redsocks restart

#transock_ev is used only for https
#starting transock_ev on port 5005 using SOCKS proxy-mu:1080
# ./transocks_ev -p 5005 -S proxy-mu.intel.com -s 1080

############################## checks
# wget https://www.google.com -O /dev/null
# wget http://www.wp.pl -O /dev/null


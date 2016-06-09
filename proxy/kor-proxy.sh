
### one -time
# echo "net.ipv4.conf.all.route_localnet=1" >>/etc/sysctl.conf
# # sysctl -w net.ipv4.conf.all.route_localnet=1
# # sysctl -p
# sysctl -n net.ipv4.conf.all.route_localnet=1

## NAT
#Creating Chain for transparency rules and adding for flow chains (output and "routing")
iptables -N REDSOCKS -t nat
iptables -I OUTPUT -t nat -j REDSOCKS # required by process that eg. VMs or local wget without http_proxy set
iptables -I PREROUTING -t nat -j REDSOCKS # required by eg. docker

# subnet=$(wget http://autoproxy.intel.com/ -O- | ./proxynet)
# for subnet in $subnet; do
#     sudo iptables -A REDSOCKS -t nat -d $subnet -j RETURN
# done


#Return if LAN forward to proxy for http (on proxy-mu ip)/https
iptables -A REDSOCKS -t nat -d 10.0.0.0/8 -j RETURN
iptables -A REDSOCKS -t nat -d 172.17.0.0/16 -j RETURN # coreos-kubernetes
iptables -A REDSOCKS -t nat -d 10.4.0.0/16 -j RETURN # tectonic
iptables -A REDSOCKS -t nat -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.217.247.236:911
iptables -A REDSOCKS -t nat -p tcp -m tcp --dport 443 -j DNAT --to-destination 127.0.0.1:1080

### sourcegraph binnary gada po rpc do serweera
iptables -A REDSOCKS -t nat -p tcp -m tcp --dport 3100 -j DNAT --to-destination 127.0.0.1:1080

#adding filter rules for transock_ev, dns, http_proxy and packets that are allready accepted for "routing"
## FILTER
iptables -I INPUT -p tcp -m tcp --dport 1080 -j ACCEPT
iptables -I FORWARD -p udp -m udp --dport 53 -m conntrack --ctstate NEW -j ACCEPT
iptables -I FORWARD -p tcp -m tcp --dport 911 -m conntrack --ctstate NEW -j ACCEPT
iptables -I FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT 

#service redsocks restart

#transock_ev is used only for https
#starting transock_ev on port 5005 using SOCKS proxy-mu:1080
# ./transocks_ev -p 5005 -S proxy-mu.intel.com -s 1080

############################## clear
# iptables -t nat -F && iptables --flush
# iptables -Z PROXY -t nat && iptables -Z && iptables -t nat -Z POSTROUTING && iptables -t nat -Z PREROUTING && iptables -t nat -Z OUTPUT
# iptables -t nat -X REDSOCKS

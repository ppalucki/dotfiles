https://intelpedia.intel.com/LinuxDesktop#System-wide_automatic_transparent_proxy

############## proxy redirecotr
sudo apt-get install redsocks
sudo cp /etc/redsocks.conf /etc/redsocks.conf.backup
# from wiki
wget --no-check-certificate https://intelpedia.intel.com/images/a/a1/Redsocks.conf.txt 
sudo cp Redsocks.conf.txt /etc/redsocks.conf
# my own
sudo cp ~/work/proxy/redsocks.conf.my /etc/redsocks.conf 
# restart
sudo service redsocks restart
sudo service redsocks status

############# step 2
# Run iptables -t raw -n -L and if you see NOTRACK there, you have this enabled;
sudo iptables -t raw -n -L

# wget 
wget --no-check-certificate https://intelpedia.intel.com/images/7/77/Proxynet.txt -O proxynet
wget --no-check-certificate https://intelpedia.intel.com/images/1/1e/Setup-proxy.sh.txt -O setup-proxy.sh
chmod +x proxynet setup-proxy.sh


sudo iptables-save -c -t nat
sudo iptables -t nat -vnL

unset http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY


### monitor

watch -n0.5 -d 'sudo iptables-save -c -t nat'

sudo iftop
sudo bmon

# first delte all the rules that reference to CNI chain
sudo iptables -t nat -D POSTROUTING -s 172.16.28.0/24 -j CNI-default-4bb65fd7ea4bbe8c
# delete chain itselfs
sudo iptables-save | grep :CNI | cut -f 1 -d " " | cut -f 2 -d ':' | sudo xargs -n1 iptables -t nat -X


sudo iptables --flush
sudo iptables -t nat -F 
sudo iptables -t nat -Z REDSOCKS  
sud oiptables -t nat -Z POSTROUTING 
sudo iptables -t nat -Z PREROUTING 
sudo iptables -t nat -Z OUTPUT
sudo iptables -t nat -X REDSOCKS
watch -n0.5 -d=p sudo iptables-save -t nat

sudo ./kor-proxy.sh




#
wget http://wp.pl
wget https://wp.pl

########## BEST WATCHES
watch -n0.2 -d=p 'sudo iptables-save -c -t nat; echo; sudo iptables-save -c -t filter'
watch -n0.5 --no-title -d=p 'echo --------------------- nat --------------------;sudo iptables -t nat -L -v -n --line-numbers; echo ---------------------- filter ------------------------; sudo iptables -t filter -L -v -n --line-numbers'





#-------------------------------- ANSIBLE --------------------------------------------
export ANSIBLE_CACHE_PLUGIN_CONNECTION=/tmp/ansible-caches ANSIBLE_CACHE_PLUGIN=jsonfile
ANSBILE_KEEP_REMOTE_FILES=1


#### dotfiles

Just bunch of my configurations files...

#### tips

usually are in form of zshrc or git aliases but there are some others

##### sshd port forwarding:
    
vim /etc/ssh/sshd_config 

```
AllowTcpForwarding yes
UsePrivilegeSeparation yes
```

and remember to run ssh client as root/admin


##### Security issues :)

```
sudo setenforce 0
sudo systemctl disable firewalld
```


##### get vim

```
wget --no-check-certificate https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox_VI -O vi
chmod +x vi
```

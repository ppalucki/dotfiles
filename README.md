dotfiles
========

Just bunch of my configurations files...

Other tips:
===========

sshd port forwarding:
---------------------
    
vim /etc/ssh/sshd_config 

AllowTcpForwarding yes
UsePrivilegeSeparation yes

and remember to run ssh client as root/admin

--- 
sudo setenforce 0
sudo systemctl disable firewalld

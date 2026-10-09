sudo apt-get install redsocks
which redsocks

# ln -s /home/ppalucki/dotfiles/proxy/redsocks.service /etc/systemd/system/
# ln -s /home/ppalucki/dotfiles/proxy/redsocksFW.service /etc/systemd/system/
# sudo cp /home/ppalucki/dotfiles/proxy/redsocksFW.service /etc/systemd/system/

sudo cp /home/ppalucki/dotfiles/proxy/redsocks.service /etc/systemd/system/
sudo ls /etc/systemd/system/red*
cat /etc/systemd/system/redsocks.service | grep ExecStart

sudo systemctl daemon-reload
sudo systemctl enable redsocks redsocks
sudo systemctl restart redsocks redsocks
sudo systemctl status redsocks redsocks
systemctl status redsocks 

# TURN ON AND CHECK
sudo ./start_proxy.sh
./check_proxy.sh

sudo systemctl status docker
sudo systemctl stop docker

# TURN OFF
sudo ./cleartables.sh
sudo ./check_proxy.sh

env | grep -i _proxy

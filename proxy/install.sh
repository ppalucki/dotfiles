# ln -s /home/ppalucki/dotfiles/proxy/redsocks.service /etc/systemd/system/
# ln -s /home/ppalucki/dotfiles/proxy/redsocksFW.service /etc/systemd/system/
sudo cp /home/ppalucki/dotfiles/proxy/redsocks.service /etc/systemd/system/
sudo cp /home/ppalucki/dotfiles/proxy/redsocksFW.service /etc/systemd/system/
sudo ls /etc/systemd/system/red*
sudo systemctl daemon-reload
sudo systemctl enable redsocks redsocksFW
sudo systemctl start redsocks redsocksFW
systemctl status redsocks redsocksFW | cat

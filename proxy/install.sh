ln -s /home/ppalucki/dotfiles/proxy/redsocks.service /etc/systemd/system/
ln -s /home/ppalucki/dotfiles/proxy/redsocksFW.service /etc/systemd/system/
systemctl daemon-firewall
systemctl enable redsocks redsocksFW
systemctl start redsocks redsocksFW
systemctl status redsocks redsocksFW

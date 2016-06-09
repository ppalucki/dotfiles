# ln -s /home/ppalucki/dotfiles/proxy/redsocks.service /etc/systemd/system/
# ln -s /home/ppalucki/dotfiles/proxy/redsocksFW.service /etc/systemd/system/
cp /home/ppalucki/dotfiles/proxy/redsocks.service /etc/systemd/system/
cp /home/ppalucki/dotfiles/proxy/redsocksFW.service /etc/systemd/system/
ls /etc/systemd/system/red*
systemctl daemon-reload
systemctl enable redsocks redsocksFW
systemctl start redsocks redsocksFW
systemctl status redsocks redsocksFW | cat

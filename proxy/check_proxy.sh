set -e
pgrep redsocks
systemctl status redsocks
wget https://www.google.com -O /dev/null
wget http://www.google.com -O /dev/null
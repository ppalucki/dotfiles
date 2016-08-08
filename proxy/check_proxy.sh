set -e
# set -x
echo "================================ check process "
pgrep redsocks
echo "================================ check service "
systemctl status redsocks
echo "================================ check https "
wget https://www.google.com -O /dev/null
echo "================================ check http "
wget http://www.google.com -O /dev/null
echo "================================ check ssh "
ssh -T git@github.com
echo "OK"

set -e
set -x

echo "================================ check process "
pgrep redsocks

echo "================================ check service "
systemctl status redsocks

echo "================================ check http "
wget --timeout=5 http://www.google.com -O /dev/null

echo "================================ check https "
wget --timeout=5 https://www.google.com -O /dev/null

echo "================================ check ssh "
ssh -o ConnectTimeout=5s -T git@github.com || true

echo "================================ docker centos"
docker run -ti --name check_proxy --rm busybox wget -S -O- http://ifconfig.me

echo "OK"

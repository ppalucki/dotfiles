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

echo "================================ docker http"
docker run -ti --name check_proxy --rm busybox wget -S -O- http://ifconfig.me

echo "================================ docker https "
docker run -ti --name check_proxy --rm busybox wget -S -O- https://ifconfig.me

echo "OK"


echo "================================ Environment variables used e.g. kind  "
env | grep -i proxy

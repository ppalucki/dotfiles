#!/bin/bash
pushd "$(dirname "$0")"
sudo systemctl kill redsocks
sudo ./cleartables.sh
sudo ./start_proxy.sh
sudo systemctl start redsocks
./check_proxy.sh
popd

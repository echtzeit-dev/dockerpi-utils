#!/bin/bash

echo "Once startup is done, login with pi/raspberry and run: sudo systemctl start ssh.service"
echo "Ready?"
read -r

mkdir -p sdcard
docker run -it -v $(pwd)/sdcard:/sdcard -p 5022:22 --name dockerpi lukechilds/dockerpi pi3

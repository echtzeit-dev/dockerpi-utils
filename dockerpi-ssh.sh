#!/bin/bash
set -ex

# First run:
# > docker run -it -v $(pwd)/sdcard:/sdcard -p 5022:22 --name dockerpi lukechilds/dockerpi pi3
# ...
# pi@raspberrypi:~$ sudo systemctl start ssh.service

ip=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" dockerpi)
ssh -p 5022 pi@$ip

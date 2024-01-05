# dockerpi-utils

Scripts and utilities for working with https://github.com/lukechilds/dockerpi

## Usage

Initialize `sdcard/filesystem.img`:
```
$ git clone https://github.com/echtzeit-dev/dockerpi-utils
$ cd dockerpi-utils
$ ./dockerpi-run.sh
Once startup is done, login with pi/raspberry and run: sudo systemctl start ssh.service
Ready?
```

Press enter and wait for the boot process to finish. Then shutdown the container:
```
$ docker stop dockerpi
$ docker rm dockerpi
```

There should be a `sdcard/filesystem.img` now. Let's mount it and put in our executable:
```
$ sudo ./dockerpifs-open.sh
Successfully mounted sdcard/filesystem.img in dockerpifs!
$ cp /path/to/executable dockerpifs/home/pi/.
$ sudo ./dockerpifs-close.sh
Successfully unmounted sdcard/filesystem.img from dockerpifs!
```

We can run the image again and find the exectuable in our home directory:
```
$ ./dockerpi-run.sh
Once startup is done, login with pi/raspberry and run: sudo systemctl start ssh.service
Ready?
<Enter>
...
Raspbian GNU/Linux 10 raspberrypi ttyAMA0

raspberrypi login: pi
password: raspberry
...
pi@raspberrypi:~$ ls
executable
pi@raspberrypi:~$ sudo systemctl start ssh.service
pi@raspberrypi:~$
```

From another terminal, we can now ssh into the Pi:
```
$ cd dockerpi-utils
$ ./dockerpi-ssh.sh
++ docker inspect -f '{{ .NetworkSettings.IPAddress }}' dockerpi
+ ip=172.17.0.3
+ ssh -p 5022 pi@172.17.0.3
...
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
pi@172.17.0.3's password: raspberry
...
pi@raspberrypi:~ $
```

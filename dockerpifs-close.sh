#!/bin/bash
set -e

lock_file=".dockerfilefs"
if [ ! -e "$lock_file" ]; then
    echo "No lock file $lock_file present. There doesn't seem to be an open dockerpifs!"
    exit 1
fi

loop_device=$(<"$lock_file")
umount dockerpifs
losetup -d $loop_device

rm $lock_file
echo "Successfully unmounted sdcard/filesystem.img from dockerpifs!"

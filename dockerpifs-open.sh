#!/bin/bash
set -e

image_path="${1:-sdcard/filesystem.img}"
if [ ! -e $image_path ]; then
  echo "No filesystem image found at: ${image_path}"
  exit 1
fi

lock_file=".dockerfilefs"
if [ -e "$lock_file" ]; then
    echo "The lock file $file_to_check exists. There seems to be an open dockerpifs already!"
    exit 1
fi

loop_device=$(losetup -f --show -P $image_path)

mkdir -p dockerpifs
mount ${loop_device}p2 dockerpifs
echo $loop_device > $lock_file

if [ ! -d "dockerpifs/bin" ] || [ ! -d "dockerpifs/boot" ]; then
  echo "Error: the mounted filesystem has unexpected contents:"
  ls -lh dockerpifs
fi

echo "Successfully mounted $image_path in dockerpifs!"

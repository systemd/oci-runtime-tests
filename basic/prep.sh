#!/bin/bash -ex

mkdir -p src/public
chmod a+rwx src/public
rm -f src/public/test
echo 'file contents' > src/file

if ! [ -d "rootfs" ]; then
        sudo unsquashfs -d rootfs rootfs.squash
fi

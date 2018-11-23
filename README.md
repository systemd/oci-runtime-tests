Not much to see here yet

```console
$ cd basic
$ ./prep.sh
+ mkdir -p src/public
+ chmod a+rwx src/public
+ rm -f src/public/test
+ echo 'file contents'
+ '[' -d rootfs ']'
+ sudo unsquashfs -d rootfs rootfs.squash
Parallel unsquashfs: Using 2 processors
3620 inodes (3207 blocks) to write

[=================================|] 3207/3207 100%

created 2247 files
created 1988 directories
created 738 symlinks
created 0 devices
created 0 fifos
$ sudo systemd-nspawn --oci-bundle=.
...
+ echo 'Checking UID and GID'
Checking UID and GID
...
+ echo OK
OK
```

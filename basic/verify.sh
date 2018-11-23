#!/bin/bash
set -ex

echo 'Checking UID and GID'
test "$(id -u)" = "14"
test "$(id -g)" = "14"
test "$(id -G)" = "14 59 81"

# FIXME: test with user not in /etc/passwd, currently this fails
# FIXME: test with groups not in /etc/passwd, currently this fails

echo 'Checking terminal size'

# Width and height it set to absurd values, but we have terminal:false. The
# spec says it should not be propagated if terminal:false.
test "$COLUMNS" != "6667"
test "$COLUMNS" != "6668"

echo 'Checking variables'
test "$FOO" = "BAR"
test "$WITHSPACES" = "FOO BAR"
test "$WITHSHELLCHARS" = $'$ASDF \\\"asdf asdf\\\" !'
test "$WITHCONTROLCHARS" = $'\\123\\125\\010\\020'
test "$TERM" = "xterm"

echo 'Checking working directory and mount points'
# "src" is mounted under /tmp to avoid issues with read-only filesystem images
test "$PWD" = '/tmp/src'
test -f ./file
test "$(cat ./file)" = "file contents"

# This should be read-only
touch /tmp/src/public/test || :
test ! -f /tmp/src/public/test || : # FIXME: 'ro' is ignored, bug?

echo 'Checking that configuration on various mount points is correctly ignored'
test "$(stat -c %a /dev)" != "404"
test "$(stat -c %a /dev/pts)" != "404"
test "$(stat -c %a /dev/shm)" != "404"
test "$(stat -c %a /dev/mqueue)" != "404"
test "$(stat -c %a /sys)" != "404"
test "$(stat -c %a /sys/fs/cgroup)" != "404"

echo 'Checking permissions on various mount points'
test "$(stat -c %a /dev)" = "755"
test "$(stat -c %a /dev/pts)" = "755"
test "$(stat -c %a /dev/shm)" = "1777"
test "$(stat -c %a /dev/mqueue)" = "1777"
test "$(stat -c %a /sys)" = "555"
test "$(stat -c %a /sys/fs/cgroup)" = "755"

echo "Checking rlimits"
test "$(ulimit -H -n)" = "1020"
test "$(ulimit -S -n)" = "1020"

echo OK

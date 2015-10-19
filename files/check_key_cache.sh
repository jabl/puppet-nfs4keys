#!/bin/bash

# Copyright (C) 2015 Janne Blomqvist

# This checks that the size of the root user key cache is at least as
# large as in recent upstream kernels, per
# https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=738c5d190f6540539a04baf36ce21d46b5da04bd

read maxkeys < /proc/sys/kernel/keys/root_maxkeys
if [[ $maxkeys -lt 1000000 ]]
then
    echo 1000000 > /proc/sys/kernel/keys/root_maxkeys
fi

read maxbytes < /proc/sys/kernel/keys/root_maxbytes
if [[ $maxbytes -lt 25000000 ]]
then
    echo 25000000 > /proc/sys/kernel/keys/root_maxbytes
fi

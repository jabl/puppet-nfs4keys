# nfs4keys

#### Table of Contents

1. [Overview](#overview)
2. [What nfs4keys affects](#what-nfs4keys-affects)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module makes sure that the kernel key cache for the root user
matches the default from Linux kernel 3.18+, and that the keyutils
package is installed. Otherwise ID lookup occasionally fails when
using NFSv4.

## What nfs4keys affects

* Creates and executes a shell script /tmp/check_key_cache.sh.

## Usage

There are no parameters or such, just include the class like

    class { '::nfs4keys': }


## Reference

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=758870

https://bugs.launchpad.net/fedora/+bug/1124250

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=738c5d190f6540539a04baf36ce21d46b5da04bd

## Limitations

Tested on Ubuntu 14.04. Should be a no-op on CentOS 6 & 7.


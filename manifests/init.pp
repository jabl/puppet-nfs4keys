# == Class: nfs4keys
#
# Makes sure that root kernel key cache is at least as large as in
# recent upstream kernels. Uses a shell script as apparently having
# puppet/ruby reading /proc entries is not reliable.
#
# === Parameters
#
# No parameters.
#
# === Variables
#
# === Examples
#
#  class { 'nfs4keys': }
#
# === Authors
#
# Janne Blomqvist <janne.blomqvist@aalto.fi>
#
# === Copyright
#
# Copyright 2015 Janne Blomqvist
#
class nfs4keys {

  case $::osfamily {
    'Debian': {
      file {'/etc/sysctl.d/66-keycache-nfs4.conf':
        source => 'puppet:///modules/nfs4keys/66-keycache_nfs4.conf',
        owner  => root,
        group  => root,
        mode   => 0644
      }

      exec {'/sbin/sysctl --system --pattern kernel.keys.root_max':
        subscribe   => File['/etc/sysctl.d/66-keycache-nfs4.conf'],
        refreshonly => true
      }
    }
  }

  # Also make sure that keyutils is installed, otherwise renewing
  # expired keys doesn't work properly.
  ensure_packages ('keyutils')

}

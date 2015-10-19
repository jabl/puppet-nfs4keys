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

  file {'/tmp/check_key_cache.sh':
    source => 'puppet:///modules/nfs4keys/check_key_cache.sh',
    owner  => root,
    group  => root,
    mode   => 0755
  }

  exec {'/tmp/check_key_cache.sh':
    subscribe => File['/tmp/check_key_cache.sh']
  }

  # Also make sure that keyutils is installed, otherwise renewing
  # expired keys doesn't work properly.
  ensure_packages ('keyutils')

}

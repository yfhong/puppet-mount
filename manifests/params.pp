# == Class mount::params
#
# This class is meant to be called from mount.
# It sets variables according to platform.
#
class mount::params {

  $fstab_file = '/etc/fstab'

  $root_group = $::operatingsystem ? {
    /(FreeBSD|Solaris)/ => 'wheel',
    default             => 'root',
  }

  case $::operatingsystem {
    'Debian', 'Ubuntu',
    'RedHat', 'CentOS',
    'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

}

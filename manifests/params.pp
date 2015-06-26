# == Class mount::params
#
# This class is meant to be called from mount.
# It sets variables according to platform.
#
class mount::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'mount'
      $service_name = 'mount'
    }
    'RedHat', 'Amazon': {
      $package_name = 'mount'
      $service_name = 'mount'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}

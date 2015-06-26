# == Class mount::install
#
# This class is called from mount for install.
#
class mount::install {

  package { $::mount::package_name:
    ensure => present,
  }
}

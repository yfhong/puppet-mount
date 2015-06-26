# == Class mount::service
#
# This class is meant to be called from mount.
# It ensure the service is running.
#
class mount::service {

  service { $::mount::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}

# == Class: mount
#
# Full description of class mount here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class mount (
  $package_name = $::mount::params::package_name,
  $service_name = $::mount::params::service_name,
) inherits ::mount::params {

  # validate parameters here

  class { '::mount::install': } ->
  class { '::mount::config': } ~>
  class { '::mount::service': } ->
  Class['::mount']
}

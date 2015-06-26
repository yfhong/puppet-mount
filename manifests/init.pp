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
  $fstab_file = $::mount::params::fstab_file,
  $root_group = $::mount::params::root_group,
) inherits ::mount::params {

  # validate parameters here

  class { '::mount::config': } ->
  Class['::mount']
}

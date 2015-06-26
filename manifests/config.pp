# == Class mount::config
#
# This class is called from mount for service config.
#
# mount::entries:
#   '/srv':
#     device: '/dev/vdb'
#     fstype: "xfs"
#     options:
#       - "nosuid"
#       - "uid=12345"
#     dump: "1"
#     pass: "2"
class mount::config {

  $entries = hiera_hash('mount::entries', undef)

  $mount_defaults = {
    ensure   => present,
    fstype   => 'xfs',
    options  => 'defaults',
    dump     => '0',
    pass     => '2',
    remounts => true,
  }

  if ($entries) {
    create_resources(mount, $entries, $mount_defaults)
  }
}

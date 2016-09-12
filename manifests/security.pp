# This class can be used install security components.
#
# @example when declaring the ufw class
#  class { '::stacks::security': }
#
# @param selinux (Boolean) Manage selinux on this node.
class stacks::security (
  $selinux = false,
) {
  validate_bool( $selinux )

  if $selinux {
    class { '::profiles::selinux': }
  }
}

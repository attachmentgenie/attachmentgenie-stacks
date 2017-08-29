# This class can be used install repo components
#
# @example when declaring the gitlab gclass
#  class { '::stacks::repo': }
#
# @param aptly  Manage aptly on this node.
class stacks::repo (
  Boolean $aptly = false,
) {
  if $aptly {
    class { '::profiles::aptly': }
  }
}

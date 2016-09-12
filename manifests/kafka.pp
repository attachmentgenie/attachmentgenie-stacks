# This class can be used install kafka and zookeeper.
#
# @example when declaring the ufw class
#  class { '::stacks::kafka': }
#
# @param kafka (Boolean) Manage kafka on this node.
# @param zookeeper (Boolean) Manage zookeeper on this node.
class stacks::kafka (
  $kafka = false,
  $zookeeper = false,
) {
  validate_bool($kafka,
    $zookeeper
  )
  if $kafka {
    class {'::profiles::kafka':}
  }
  if $zookeeper {
    class { '::profiles::zookeeper':}
  }
}

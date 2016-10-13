# This class can be used install kafka and zookeeper.
#
# @example when declaring the kafka class
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
    if $zookeeper {
      Service['zookeeper-server'] -> Service['kafka']
    }
  }
  if $zookeeper {
    class { '::profiles::zookeeper':}
  }
}

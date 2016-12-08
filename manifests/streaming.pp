# This class can be used install streaming and zookeeper.
#
# @example when declaring the streaming class
#  class { '::stacks::streaming': }
#
# @param flink (Boolean) Manage flink on this node.
# @param kafka (Boolean) Manage kafka on this node.
# @param zookeeper (Boolean) Manage zookeeper on this node.
class stacks::streaming (
  $flink     = false,
  $kafka     = false,
  $zookeeper = false,
) {
  validate_bool(
    $flink,
    $kafka,
    $zookeeper
  )
  if $flink {
    class { '::profiles::flink':}
  }
  if $kafka {
    class {'::profiles::kafka':}
    if $zookeeper {
      Class['zookeeper::service'] -> Class['kafka::broker::service']
    }
  }
  if $zookeeper {
    class { '::profiles::zookeeper':}
  }
}

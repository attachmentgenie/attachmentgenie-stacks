# This class can be used install metrics.
#
# @example when declaring the metrics class
#  class { '::stacks::metrics': }
#
# @param influxdb (Boolean) Manage influxdb on this node.
# @param mongodb (Boolean) Manage mongodb on this node.
# @param mysql (Boolean) Manage mysql on this node.
# @param neo4j (Boolean) Manage neo4j on this node.
# @param postgresql (Boolean) Manage postgresql on this node.
class stacks::database (
  $influxdb   = false,
  $mongodb    = false,
  $mysql      = false,
  $neo4j      = false,
  $postgresql = false,
) {
  validate_bool(
    $influxdb,
    $mongodb,
    $mysql,
    $neo4j,
    $postgresql,
  )
  if $influxdb {
    class { '::profiles::influxdb':}
  }
  if $mongodb {
    class { '::profiles::mongodb':}
  }
  if $mysql {
    class { '::profiles::mysql':}
  }
  if $neo4j {
    class { '::profiles::neo4j': }
  }
  if $postgresql {
    class { '::profiles::postgresql':}
  }
}

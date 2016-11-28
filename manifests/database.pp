# This class can be used install metrics.
#
# @example when declaring the metrics class
#  class { '::stacks::metrics': }
#
# @param influxdb (Boolean) Manage influxdb on this node.
# @param postgresql (Boolean) Manage postgresql on this node.
class stacks::database (
  $influxdb   = false,
  $mysql      = false,
  $postgresql = false,
) {
  validate_bool(
    $influxdb,
    $mysql,
    $postgresql,
  )
  if $influxdb {
    class { '::profiles::influxdb':}
  }
  if $mysql {
    class { '::profiles::mysql':}
  }
  if $postgresql {
    class { '::profiles::postgresql':}
  }
}

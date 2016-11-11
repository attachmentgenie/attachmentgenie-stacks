# This class can be used install metrics.
#
# @example when declaring the metrics class
#  class { '::stacks::metrics': }
#
# @param grafana (Boolean) Manage grafana on this node.
# @param influxdb (Boolean) Manage influxdb on this node.
# @param prometheus (Boolean) Manage prometheus on this node.
class stacks::metrics (
  $grafana    = false,
  $influxdb   = false,
  $prometheus = false,
) {
  validate_bool( $grafana,
    $influxdb,
    $prometheus,
  )
  if $grafana {
    include ::profiles::grafana
  }
  if $influxdb {
    class { '::profiles::influxdb':}
  }
  if $prometheus {
    include ::profiles::prometheus
  }
}

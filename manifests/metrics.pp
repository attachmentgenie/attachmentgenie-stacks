# This class can be used install metrics.
#
# @example when declaring the metrics class
#  class { '::stacks::metrics': }
#
# @param grafana (Boolean) Manage grafana on this node.
# @param prometheus (Boolean) Manage prometheus on this node.
class stacks::metrics (
  $grafana    = false,
  $prometheus = false,
) {
  validate_bool( $grafana,
    $prometheus,
  )
  if $grafana {
    class { '::profiles::grafana': }
  }
  if $prometheus {
    class { '::profiles::prometheus': }
  }
}

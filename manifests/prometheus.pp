# This class can be used install prometheus components.
#
# @example when declaring the prometheus class
#  class { '::stacks::prometheus': }
#
# @param grafana (Boolean) Manage grafana on this node.
# @param prometheus (Boolean) Manage prometheus on this node.
class stacks::prometheus (
  $grafana    = false,
  $prometheus = false,
) {

  validate_bool(
    $grafana,
    $prometheus,
  )

  if $grafana {
    include ::profiles::apache
    include ::profiles::grafana
  }

  if $prometheus {
    include ::profiles::prometheus
  }
}
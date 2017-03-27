# == Class: stacks::metrics
#
# This class can be used install metrics.
#
# === Examples
#
# @example when declaring the metrics class
#  class { '::stacks::metrics': }
#
# === Parameters
#
# @param carbon (Boolean) Manage carbon on this node.
# @param carbon_relay (Boolean) Manage carbon_relay on this node.
# @param grafana (Boolean) Manage grafana on this node.
# @param graphite_web (Boolean) Manage graphite_web on this node.
# @param prometheus (Boolean) Manage prometheus on this node.
#
class stacks::metrics (
  $carbon       = false,
  $carbon_relay = false,
  $grafana      = false,
  $graphite_web = false,
  $prometheus   = false,
) {
  validate_bool(
    $carbon,
    $carbon_relay,
    $grafana,
    $graphite_web,
    $prometheus,
  )
  if $carbon {
    class { '::profiles::carbon': }
  }
  if $carbon_relay {
    class { '::profiles::carbon_relay': }
  }
  if $grafana {
    class { '::profiles::grafana': }
  }
  if $graphite_web {
    class { '::profiles::graphite_web': }
  }
  if $prometheus {
    class { '::profiles::prometheus': }
  }
}

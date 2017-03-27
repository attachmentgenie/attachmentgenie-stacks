# This class can be used install metrics components
#
# @example when declaring the monitroin class
#  class { '::stacks::metrics': }
#
# @param carbon (Boolean) Manage carbon on this node.
# @param grafana (Boolean) Manage grafana on this node.
# @param graphite_web (Boolean) Manage graphite_web on this node.
# @param prometheus (Boolean) Manage prometheus on this node.
#
class stacks::metrics (
  $carbon       = false,
  $grafana      = false,
  $graphite_web = false,
  $prometheus   = false,
) {
  validate_bool(
    $carbon,
    $grafana,
    $graphite_web,
    $prometheus,
  )
  if $carbon {
    class { '::profiles::carbon': }
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

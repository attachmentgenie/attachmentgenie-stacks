# This class can be used install logging.
#
# @example when declaring the logging class
#  class { '::stacks::logging': }
#
# @param elasticsearch (Boolean) Manage elasticsearch on this node.
# @param kibana (Boolean) Manage kibana on this node.
class stacks::logging (
  $elasticsearch = false,
  $kibana   = false,
) {
  validate_bool(
    $elasticsearch,
    $kibana,
  )
  if $elasticsearch {
    include ::profiles::elasticsearch
  }
  if $kibana {
    class { '::profiles::kibana':}
  }
}

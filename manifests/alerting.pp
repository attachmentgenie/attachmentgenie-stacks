# This class can be used install alerting.
#
# @example when declaring the alerting class
#  class { '::stacks::alerting': }
#
# @param alertmanager (Boolean) Manage alertmanager on this node.
class stacks::alerting (
  $alertmanager = false,
) {
  validate_bool(
    $alertmanager,
  )
  if $alertmanager {
    include ::profiles::alertmanager
  }
}

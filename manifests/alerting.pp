# This class can be used install alerting.
#
# @example when declaring the alerting class
#  class { '::stacks::alerting': }
#
# @param alertmanager (Boolean) Manage alertmanager on this node.
# @param icinga2 (Boolean) Manage icinga on this node.
# @param icinga2_web (Boolean) Manage icingaweb on this node.
class stacks::alerting (
  $alertmanager = false,
  $icinga2      = false,
  $icinga2_web  = false,
) {
  validate_bool(
    $alertmanager,
    $icinga2,
    $icinga2_web
  )
  if $alertmanager {
    class { '::profiles::alertmanager': }
  }
  if $icinga2 {
    class { '::profiles::icinga2': }
  }
  if $icinga2_web {
    class { '::profiles::icinga2_web': }
  }
}

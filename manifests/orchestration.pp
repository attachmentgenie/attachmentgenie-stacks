# This class can be used install orchestration components.
#
# @example when declaring the orchestration class
#  class { '::stacks::orchestration': }
#
# @param mcollective (Boolean) Manage mcollective on this node.
# @param rundeck (Boolean) Manage rundeck on this node.
class stacks::orchestration (
  $mcollective = false,
  $rundeck = false,
) {
  validate_bool(
    $mcollective,
    $rundeck,
  )

  if $mcollective {
    class { '::profiles::mcollective': }
  }
  if $rundeck {
    class { '::profiles::rundeck': }
  }
}
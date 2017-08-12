# This class can be used install orchestration components.
#
# @example when declaring the orchestration class
#  class { '::stacks::orchestration': }
#
# @param consul (Boolean) Manage consul on this node.
# @param mcollective (Boolean) Manage mcollective on this node.
# @param rundeck (Boolean) Manage rundeck on this node.
class stacks::orchestration (
  $consul      = false,
  $mcollective = false,
  $rundeck     = false,
) {
  validate_bool(
    $consul,
    $mcollective,
    $rundeck,
  )
  if $consul {
    class { '::profiles::consul': }
  }
  if $mcollective {
    class { '::profiles::mcollective': }
  }
  if $rundeck {
    class { '::profiles::rundeck': }
  }
}
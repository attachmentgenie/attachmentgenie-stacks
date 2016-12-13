# This class can be used install orchestration components.
#
# @example when declaring the orchestration class
#  class { '::stacks::orchestration': }
#
# @param mcollective (Boolean) Manage mcollective on this node.
# @param mcollective_r10k (Boolean) Manage mcollective_r10k on this node.
# @param rundeck (Boolean) Manage rundeck on this node.
class stacks::orchestration (
  $mcollective      = false,
  $mcollective_r10k = false,
  $rundeck          = false,
) {
  validate_bool(
    $mcollective,
    $mcollective_r10k,
    $rundeck,
  )

  if $mcollective {
    class { '::profiles::mcollective': }
    if $mcollective_r10k {
      class { '::profiles::mcollective_r10k': }
      Class['::profiles::mcollective'] -> Class['::r10k::mcollective']
    }
  }
  if $rundeck {
    class { '::profiles::rundeck': }
  }
}
# This class can be used install orchestration components.
#
# @example when declaring the orchestration class
#  class { '::stacks::orchestration': }
#
# @param mcollective (Boolean) Manage mcollective on this node.
class stacks::orchestration (
  $mcollective = false,
) {
  validate_bool( $mcollective )

  if $mcollective {
    class { '::profiles::mcollective': }
  }
}
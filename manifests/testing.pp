# This class can be used install testing components.
#
# @example when declaring the testing class
#  class { '::stacks::testing': }
#
# @param jenkins (Boolean) Manage jenkins on this node.
class stacks::testing (
  $jenkins = false,
){
  validate_bool(
    $jenkins,
  )
  if $jenkins {
    class { '::profiles::jenkins': }
  }
}

# This class can be used install testing components.
#
# @example when declaring the testing class
#  class { '::stacks::testing': }
#
# @param develop (Boolean) Manage ability to develop on this node.
# @param jenkins (Boolean) Manage jenkins on this node.
# @param package (Boolean) Manage abiltiy to create packages on this node.
class stacks::testing (
  $develop = false,
  $jenkins = false,
  $package = false,
){
  validate_bool( $develop,
    $jenkins,
    $package
  )
  if $develop {
    class { '::profiles::develop': }
  }
  if $jenkins {
    class { '::profiles::jenkins': }
  }
  if $package {
    class { '::profiles::package': }
  }
}

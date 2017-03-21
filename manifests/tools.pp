# This class can be used install tools components.
#
# @example when declaring the tools class
#  class { '::stacks::tools': }
#
# @param compile (Boolean) Manage ability to compile on this node.
# @param package (Boolean) Manage abiltiy to create packages on this node.
class stacks::tools (
  $compile = false,
  $package = false,
){
  validate_bool(
    $compile,
    $package
  )
  if $compile {
    class { '::profiles::compile': }
  }
  if $package {
    class { '::profiles::package': }
  }
}

# This class can be used install runtime components.
#
# @example when declaring the runtime class
#  class { '::stacks::runtime': }
#
# @param docker (Boolean) Manage docker on this node.
# @param java (Boolean) Manage java on this node.
# @param golang (Boolean) Manage golang on this node.
# @param nodejs (Boolean) Manage nodejs on this node.
# @param php (Boolean) Manage php on this node.
# @param python (Boolean) Manage python on this node.
# @param ruby (Boolean) Manage ruby on this node.
# @param scala (Boolean) Manage scala on this node.
class stacks::runtime (
  $docker = false,
  $java   = false,
  $golang = false,
  $nodejs = false,
  $php    = false,
  $python = false,
  $ruby   = false,
  $scala  = false,
) {
  validate_bool(
    $docker,
    $java,
    $golang,
    $nodejs,
    $php,
    $python,
    $ruby,
    $scala,
  )
  if $docker {
    class { '::profiles::docker': }
  }
  if $java {
    class { '::profiles::java': }
  }
  if $golang {
    class { '::profiles::golang': }
  }
  if $nodejs {
    class { '::profiles::nodejs': }
  }
  if $php {
    class { '::profiles::php': }
  }
  if $python {
    class { '::profiles::python': }
  }
  if $ruby {
    class { '::profiles::ruby': }
  }
  if $scala {
    class { '::profiles::scala': }
  }
}
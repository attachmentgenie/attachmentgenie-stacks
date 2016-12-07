# This class can be used install runtime components.
#
# @example when declaring the runtime class
#  class { '::stacks::runtime': }
#
# @param java (Boolean) Manage java on this node.
# @param golang (Boolean) Manage golang on this node.
# @param nodejs (Boolean) Manage nodejs on this node.
# @param php (Boolean) Manage php on this node.
# @param python (Boolean) Manage python on this node.
# @param ruby (Boolean) Manage ruby on this node.
# @param scala (Boolean) Manage scala on this node.
class stacks::runtime (
  $java   = false,
  $golang = false,
  $nodejs = false,
  $php    = false,
  $python = false,
  $ruby   = false,
  $scala  = false,
) {
  validate_bool(
    $java,
    $golang,
    $nodejs,
    $php,
    $python,
    $ruby,
    $scala,
  )
  if $java {
    include ::profiles::java
  }
  if $golang {
    include ::profiles::golang
  }
  if $nodejs {
    include ::profiles::nodejs
  }
  if $php {
    include ::profiles::php
  }
  if $python {
    include ::profiles::python
  }
  if $ruby {
    include ::profiles::ruby
  }
  if $scala {
    include ::profiles::scala
  }
}
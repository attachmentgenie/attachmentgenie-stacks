# This class can be used install runtime components.
#
# @example when declaring the runtime class
#  class { '::stacks::runtime': }
#
# @param java (Boolean) Manage java on this node.
# @param python (Boolean) Manage python on this node.
# @param scala (Boolean) Manage scala on this node.
class stacks::runtime (
  $java   = false,
  $python = false,
  $scala  = false,
) {
  validate_bool(
    $java,
    $python,
    $scala,
  )
  if $java {
    include ::profiles::java
  }
  if $python {
    include ::profiles::python
  }
  if $scala {
    include ::profiles::scala
  }
}
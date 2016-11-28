# This class can be used install runtime components.
#
# @example when declaring the runtime class
#  class { '::stacks::runtime': }
#
# @param java (Boolean) Manage java on this node.
# @param scala (Boolean) Manage scala on this node.
class stacks::runtime (
  $java   = false,
  $scala  = false,
) {
  validate_bool(
    $java,
    $scala,
  )
  if $java {
    include ::profiles::java
  }
  if $scala {
    include ::profiles::scala
  }
}
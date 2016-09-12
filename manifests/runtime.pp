# This class can be used install runtime components.
#
# @example when declaring the runtime class
#  class { '::stacks::runtime': }
#
# @param java (Boolean) Manage java on this node.
class stacks::runtime (
  $java = false,
) {
  validate_bool($java)

  if $java {
    include ::profiles::java
  }
}
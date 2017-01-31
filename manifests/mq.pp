# This class can be used install mq components.
#
# @example when declaring the mq class
#  class { '::stacks::mq': }
#
# @param activemq (Boolean) Manage activemq on this node.
class stacks::mq (
  $activemq         = false,
) {
  validate_bool(
    $activemq,
  )

  if $activemq {
    class { '::profiles::activemq': }
  }
}

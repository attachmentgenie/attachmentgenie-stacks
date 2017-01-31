# This class can be used install proxy components
#
# @example when declaring the proxy class
#  class { '::stacks::proxy': }
#
# @param haproxy (Boolean) Manage haproxy on this node.
class stacks::proxy (
  $haproxy = false,
){
  validate_bool(
    $haproxy,
  )
  if $haproxy {
    class { '::profiles::haproxy': }
  }
}

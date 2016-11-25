# This class can be used install proxy components
#
# @example when declaring the proxy class
#  class { '::stacks::proxy': }
#
# @param haproxy (Boolean) Manage haproxy on this node.
# @param nginx (Boolean) Manage nginx on this node.
class stacks::proxy (
  $haproxy = false,
  $nginx = false,
){
  validate_bool(
    $haproxy,
    $nginx,
  )
  if $haproxy {
    class { '::profiles::haproxy': }
  }
  if $nginx {
    class { '::profiles::nginx': }
  }
}

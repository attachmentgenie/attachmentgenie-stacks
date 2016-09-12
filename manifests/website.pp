# This class can be used install website components
#
# @example when declaring the website class
#  class { '::stacks::website': }
#
# @param apache (Boolean) Manage apache on this node.
# @param haproxy_balancermember (Boolean) Register this node with the haproxy instance.
class stacks::website (
  $apache = false,
  $haproxy_balancermember = false,
){
  validate_bool(
    $apache,
    $haproxy_balancermember,
  )
  if $apache {
    class { '::profiles::apache': }
  }
  if $haproxy_balancermember {
    @@haproxy::haproxy_balancermember { $::hostname:
      listening_service => 'platform-http',
      server_names      => $::fqdn,
      ipaddresses       => $::ipaddress_eth1,
      ports             => '80',
    }
  }
}
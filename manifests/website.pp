# == Class: stacks::website
#
# This class can be used install website components
#
# === Examples
#
# @example when declaring the website class
#  class { '::stacks::website': }
#
# === Parameters
#
# @param apache [Boolean] Manage apache on this node.
# @param haproxy_balancermember [Boolean] Register this node with the haproxy instance.
# @param letsencrypt [Boolean] Manage letsencrypt certificates.
# @param nginx [Boolean] Manage nginx on this node.
# @param uwsgi [Boolean] Manage uwsgi on this node.
#
class stacks::website (
  $apache                 = false,
  $haproxy_balancermember = false,
  $letsencrypt            = false,
  $nginx                  = false,
  $uwsgi                  = false,
){
  validate_bool(
    $apache,
    $haproxy_balancermember,
    $letsencrypt,
    $nginx,
    $uwsgi,
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

  if $letsencrypt {
    class { '::profiles::letsencrypt': }
  }

  if $nginx {
    class { '::profiles::nginx': }
  }

  if $uwsgi {
    class { '::profiles::uwsgi': }
  }

}

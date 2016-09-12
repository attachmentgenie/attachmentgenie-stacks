# This class can be used install puppetmaster components.
#
# @example when declaring the puppetmaster class
#  class { '::stacks::puppetmaster': }
#
# @param activemq (Boolean) Manage activemq on this node.
# @param foreman (Boolean) Manage foreman on this node.
# @param foreman_proxy (Boolean) Manage foreman_proxy on this node.
# @param haproxy_member (Boolean) Manage haproxy_member on this node.
# @param memcached (Boolean) Manage memcached on this node.
# @param mcollective (Boolean) Manage mcollective on this node.
# @param mcollective_r10k (Boolean) Manage mcollective_r10k on this node.
# @param puppetdb (Boolean) Manage puppetdb on this node.
# @param puppetmaster (Boolean) Manage puppetmaster on this node.
# @param r10k (Boolean) Manage r10k on this node.
class stacks::puppetmaster (
  $activemq         = false,
  $foreman          = false,
  $foreman_proxy    = false,
  $haproxy_member   = false,
  $memcached        = false,
  $mcollective      = false,
  $mcollective_r10k = false,
  $puppetdb         = false,
  $puppetmaster     = false,
  $r10k             = false,
) {
  validate_bool($activemq)
  validate_bool($foreman)
  validate_bool($foreman_proxy)
  validate_bool($memcached)
  validate_bool($mcollective)
  validate_bool($mcollective_r10k)
  validate_bool($puppetdb)
  validate_bool($puppetmaster)
  validate_bool($r10k)

  if !defined(Class['::profiles::puppet']) {
    class { '::profiles::puppet': }
  }
  if $activemq {
    class { '::profiles::activemq': }
  }
  if $foreman {
    class { '::profiles::foreman': }
    Class['::puppet'] ->
    Class['::foreman']
    if $foreman and $foreman_proxy {
      Class['::foreman'] ->
      Class['::foreman_proxy::register']
    }
    if $puppetdb {
      Class['::foreman'] ->
      Class['::puppetdb::server']
    }
  }
  if $haproxy_member {
    class { '::profiles::haproxy_balancermember': }
  }
  if $memcached {
    class { '::profiles::memcached': }
    if $foreman and $memcached {
      Class['::memcached'] ->
      Class['::foreman']
    }
  }
  if $mcollective {
    if !defined(Class['::profiles::mcollective']) {
      class { '::profiles::mcollective': }
    }
    if $mcollective_r10k {
      class { '::profiles::mcollective_r10k': }
      Class['::profiles::mcollective'] ->
      Class['::r10k::mcollective']
    }
  }
  if $puppetdb {
    class { '::profiles::puppetdb': }
  }
  if $puppetmaster and $foreman_proxy {
    class { '::profiles::foreman_proxy': }
    Class['::puppet'] ->
    Class['::foreman_proxy']
  }
  if $r10k {
    class { '::profiles::r10k': }
  }
}
# This class can be used install puppetmaster components.
#
# @example when declaring the puppetmaster class
#  class { '::stacks::puppetmaster': }
#
# @param activemq (Boolean) Manage activemq on this node.
# @param foreman (Boolean) Manage foreman on this node.
# @param foreman_proxy (Boolean) Manage foreman_proxy on this node.
# @param memcached (Boolean) Manage memcached on this node.
# @param puppet (Boolean) Manage puppet on this node.
# @param puppetdb (Boolean) Manage puppetdb on this node.
# @param puppetmaster (Boolean) Manage puppetmaster on this node.
# @param r10k (Boolean) Manage r10k on this node.
class stacks::puppetmaster (
  $activemq         = false,
  $foreman          = false,
  $foreman_proxy    = false,
  $memcached        = false,
  $puppet           = false,
  $puppetdb         = false,
  $puppetmaster     = false,
  $r10k             = false,
) {
  validate_bool(
    $activemq,
    $foreman,
    $foreman_proxy,
    $memcached,
    $puppetdb,
    $puppetmaster,
    $r10k,
  )

  if $activemq {
    class { '::profiles::activemq': }
  }
  if $foreman {
    class { '::profiles::foreman': }
    if $foreman and $foreman_proxy {
      Class['::foreman'] ->
      Class['::foreman_proxy::register']
    }
  }
  if $memcached {
    class { '::profiles::memcached': }
    if $foreman and $memcached {
      Class['::memcached'] ->
      Class['::foreman']
    }
  }
  if $puppet {
    class { '::profiles::puppet': }
  }
  if $puppetdb {
    class { '::profiles::puppetdb': }
  }
  if $puppetmaster and $foreman_proxy {
    class { '::profiles::foreman_proxy': }
  }
  if $r10k {
    class { '::profiles::r10k': }
  }

}

# This class can be used install puppet components.
#
# @example when declaring the puppet class
#  class { '::stacks::puppet': }
#
# @param foreman (Boolean) Manage foreman on this node.
# @param foreman_proxy (Boolean) Manage foreman_proxy on this node.
# @param puppet (Boolean) Manage puppet on this node.
# @param puppetdb (Boolean) Manage puppetdb on this node.
# @param puppetmaster (Boolean) Manage puppetmaster on this node.
# @param r10k (Boolean) Manage r10k on this node.
class stacks::puppet (
  $foreman          = false,
  $foreman_proxy    = false,
  $puppet           = false,
  $puppetdb         = false,
  $puppetmaster     = false,
  $r10k             = false,
) {
  validate_bool(
    $foreman,
    $foreman_proxy,
    $puppet,
    $puppetdb,
    $puppetmaster,
    $r10k,
  )

  if $foreman {
    class { '::profiles::foreman': }
    if $foreman and $foreman_proxy {
      Class['::foreman']
      -> Class['::foreman_proxy::register']
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

# This class can be used to setup a bare minimum node, on top of which we can add the required technology stack.
#
# @example when declaring the bootstrap class
#  class { '::stacks::bootstrap': }
#
# @param accounts Manage accounts on this node.
# @param firewall Manage the firewall on this node.
# @param ntp Manage the time settings for this node.
# @param puppet Manage puppet on this node.
# @param repos Manage repositories on this node.
# @param ssh Manage ssh on this node.
class stacks::bootstrap (
  Boolean $accounts = false,
  Boolean $firewall = false,
  Boolean $ntp      = false,
  Boolean $puppet   = false,
  Boolean $repos    = false,
  Boolean $ssh      = false,
) {
  if $accounts{
    class { '::profiles::accounts': }
  }
  if $firewall {
    class { '::profiles::firewall': }
  }
  if $ntp {
    class { '::profiles::time': }
  }
  if $puppet {
    class { '::profiles::puppet': }
  }
  if $repos {
    class { '::profiles::repositories': }
  }
  if $ssh {
    class { '::profiles::ssh': }
  }
}

# This class can be used to setup a bare minimum node, on top of which we can add the required technology stack.
#
# @example when declaring the bootstrap class
#  class { '::stacks::bootstrap': }
#
# @param firewall (Boolean) Manage the firewall on this node.
# @param ntp (Boolean) Manage the time settings for this node.
# @param puppet (Boolean) Manage puppet on this node.
# @param repos (Boolean) Manage repositories on this node.
class stacks::bootstrap (
  $firewall = false,
  $ntp      = false,
  $puppet   = false,
  $repos    = false,
) {
  validate_bool( $firewall,
    $ntp,
    $puppet,
    $repos,
  )

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
}

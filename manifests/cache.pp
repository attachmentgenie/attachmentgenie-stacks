# This class can be used install cache components.
#
# @example when declaring the cache class
#  class { '::stacks::cache': }
#
# @param memcached (Boolean) Manage memcached on this node.
class stacks::cache (
  $memcached        = false,
) {
  validate_bool(
    $memcached,
  )

  if $memcached {
    class { '::profiles::memcached': }
  }
}

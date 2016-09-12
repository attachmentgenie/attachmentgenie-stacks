# This class can be used install neo4j.
#
# @example when declaring the ufw class
#  class { '::stacks::neo4j': }
#
# @param neo4j (Boolean) Manage neo4j on this node.
class stacks::neo4j (
  $neo4j = false,
) {
  validate_bool($neo4j)

  if $neo4j {
    include ::profiles::neo4j
  }
}
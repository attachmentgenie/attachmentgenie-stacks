class stacks::bootstrap (
  $firewall = false,
) {
  validate_bool($firewall)
  if $firewall {
    class {'::profiles::firewall':}
  }
}

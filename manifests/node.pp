class stacks::node (
  $mcollective = false,
) {
  if $mcollective {
    class { '::profiles::mcollective': }
  }
}
class stacks::node (
  $mcollective = false,
) {
  if $mcollective {
    class { '::puppetmaster::profile_mcollective': }
  }
}
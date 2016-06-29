class stacks::node (
  $mcollective = false,
) {
  class { '::epel': } ->
  class { '::profiles::time': } ->
  class { '::profiles::selinux': } ->
  class { '::profiles::firewall': } ->
  class { '::profiles::puppet': }

  if $mcollective {
    class { '::profiles::mcollective': }
  }
}
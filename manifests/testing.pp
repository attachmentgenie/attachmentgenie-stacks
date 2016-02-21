class stacks::testing (
  $motd = false,
){
  class { '::profiles::jenkins': }
  class { '::profiles::ruby': } ->
  class { '::profiles::package': }
  class { '::profiles::php': }

  if $motd {
    motd::register{ 'Stack   : testing': }
  }
}

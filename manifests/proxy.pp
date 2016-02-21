class stacks::proxy (
  $motd = false,
){
  class { '::profiles::haproxy': }

  if $motd {
    motd::register{ 'Stack   : proxy': }
  }
}

class stacks::openstack (
  $motd = false,
){
  if $motd {
    motd::register{ 'Stack   : openstack': }
  }
}
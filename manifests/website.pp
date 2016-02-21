class stacks::website (
  $motd = false,
){
  class { '::apache': }

  @@haproxy::balancermember { $::hostname:
    listening_service => 'platform-http',
    server_names      => $::fqdn,
    ipaddresses       => $::ipaddress_eth1,
    ports             => '80',
  }

  if $motd {
    motd::register{ 'Stack   : website': }
  }
}
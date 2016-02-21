class stacks::gitlab (
  $host = $::fqdn,
  $motd = false,
  $port = '8080',
) {
  class { gitlab :
    external_url => "http://${host}",
    nginx        => {
      'enable'      => true,
      'listen_port' => 8081,
    }
  }

  if $motd {
    motd::register{ 'Stack   : gitlab': }
  }
}
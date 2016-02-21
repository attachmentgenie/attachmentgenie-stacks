class stacks::bootstrap (
  $motd         = false,
  $monitor_node = true,
) {
  class { '::profiles::accounts': }
  class { '::profiles::icinga': }
  class { '::profiles::firewall': }
  class { '::profiles::rsyslog_client': }
  class { '::profiles::locale': }
  class { '::profiles::network': }
  class { '::profiles::repositories': }
  class { '::profiles::ssh': }
  class { '::profiles::time': }
  class { '::profiles::puppet': }

  if $motd {
    motd::register{ 'Stack   : bootstrap': }
  }
}

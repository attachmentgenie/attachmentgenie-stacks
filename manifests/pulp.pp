class stacks::pulp (
  $motd = false,
){
# dependency classes
  class { '::qpid::server':
    config_file => '/etc/qpid/qpidd.conf'
  }
  class { '::mongodb::server': }
  class { '::apache': }
# pulp classes
  class { '::pulp::repo':
    repo_priority => 15
  }
  class { '::pulp::server':
    db_name      => 'pulp_database',
    db_seed_list => 'localhost:27017',
  }
  class { '::pulp::admin':
    verify_ssl => false
  }
  class { '::pulp::consumer':
    verify_ssl => false
  }
# dependency packages
  package { [ 'qpid-cpp-server-store', 'python-qpid', 'python-qpid-qmf' ]:
    ensure => 'installed',
  }
# ordering
  anchor { 'profile::pulp::server::start': }
  anchor { 'profile::pulp::server::end': }
  Anchor['profile::pulp::server::start']->
  Class['::mongodb::server']->
  Class['::pulp::repo']->
  Class['::qpid::server']->
  Package['qpid-cpp-server-store'] -> Package['python-qpid'] -> Package['python-qpid-qmf'] ->
  Class['::pulp::server']->
  Class['::apache::service']->
  Class['::pulp::admin']->
  Class['::pulp::consumer']->
  Anchor['profile::pulp::server::end']

  class { '::profiles::foreman_proxy': }
  class { '::foreman_proxy::plugin::pulp':
    listen_on => 'http',
    version   => 'present',
    group     => 'foreman-proxy',
    pulp_url  => "http://${::fqdn}"
  }
  Class['::puppet'] ->
  Class['::foreman_proxy']

  if $motd {
    motd::register{ 'Stack   : pulp': }
  }
}
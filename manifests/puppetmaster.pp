class stacks::puppetmaster (
  $activemq         = false,
  $foreman          = false,
  $foreman_proxy    = false,
  $haproxy_member   = false,
  $memcached        = false,
  $mcollective      = false,
  $mcollective_r10k = false,
  $puppetdb         = false,
  $puppetmaster     = false,
  $r10k             = false,
) {
  validate_bool(
    $activemq,
    $foreman,
    $foreman_proxy,
    $memcached,
    $mcollective,
    $mcollective_r10k,
    $puppetdb,
    $puppetmaster,
    $r10k,
  )

  if !defined(Class['::profiles::puppet']) {
    class { '::profiles::puppet': }
  }
  if $activemq {
    class { '::profiles::activemq': }
  }
  if $foreman {
    class { '::profiles::foreman': }
    if $foreman and $foreman_proxy {
      Class['::foreman'] ->
      Class['::foreman_proxy::register']
    }
  }
  if $haproxy_member {
    class { '::profiles::haproxy_balancermember': }
  }
  if $memcached {
    class { '::profiles::memcached': }
    if $foreman and $memcached {
      Class['::memcached'] ->
      Class['::foreman']
    }
  }
  if $mcollective {
    if !defined(Class['::profiles::mcollective']) {
      class { '::profiles::mcollective': }
    }
    if $mcollective_r10k {
      class { '::profiles::mcollective_r10k': }
      Class['::profiles::mcollective'] ->
      Class['::r10k::mcollective']
    }
  }
  if $puppetdb {
    class { '::profiles::puppetdb': }
  }
  if $puppetmaster and $foreman_proxy {
    class { '::profiles::foreman_proxy': }
  }
  if $r10k {
    class { '::profiles::r10k': }
  }
}
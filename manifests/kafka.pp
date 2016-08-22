class stacks::kafka (
  $kafka = false,
  $zookeeper = false,
) {
  validate_bool($kafka,
    $zookeeper
  )
  if $kafka {
    class {'::profiles::kafka':}
  }
  if $zookeeper {
    class { '::profiles::zookeeper':}
  }
}

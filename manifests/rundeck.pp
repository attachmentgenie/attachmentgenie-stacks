class stacks::rundeck {
  class { '::profiles::rundeck': }

  motd::register{ 'Stack   : rundeck': }
}

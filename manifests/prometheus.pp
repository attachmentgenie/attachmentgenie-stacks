class stacks::prometheus (
  $grafana_enabled    = false,
  $prometheus_enabled = false,
) {

  validate_bool(
   $grafana_enabled,
   $prometheus_enabled,
  )

  if $grafana_enabled {
    include ::profile_apache
    include ::profile_grafana
  }

  if $prometheus_enabled {
    include ::profile_prometheus
  }
}
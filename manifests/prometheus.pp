class stacks::prometheus (
  $grafana    = false,
  $prometheus = false,
) {

  validate_bool(
    $grafana,
    $prometheus,
  )

  if $grafana {
    include ::profiles::apache
    include ::profiles::grafana
  }

  if $prometheus {
    include ::profiles::prometheus
  }
}
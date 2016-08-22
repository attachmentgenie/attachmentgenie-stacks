class stacks::runtime (
  $java = false,
) {
  validate_bool($java)

  if $java {
    include ::profiles::java
  }
}
class stacks::neo4j (
  $neo4j = false,
) {
  validate_bool($neo4j)

  if $neo4j {
    include ::profiles::neo4j
  }
}
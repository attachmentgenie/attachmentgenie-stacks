# This class can be used install monitoring components
#
# @example when declaring the monitoring class
#  class { '::stacks::monitoring': }
#
# @param collectd (Boolean) Manage collectd on this node.
# @param logstash (Boolean) Manage logstash on this node.
class stacks::monitoring (
  $collectd = false,
  $logstash = false
) {
  validate_bool( $collectd,
    $logstash,
  )
}
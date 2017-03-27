# This class can be used install monitoring components
#
# @example when declaring the monitroin class
#  class { '::stacks::monitoring': }
#
# @param carbon_relay (Boolean) Manage carbon_relay on this node.
# @param collectd (Boolean) Manage collectd on this node.
# @param logstash (Boolean) Manage logstash on this node.
# @param statsd (Boolean) Manage statsd on this node.
class stacks::monitoring (
  $carbon_relay = false,
  $collectd = false,
  $logstash = false,
  $statsd = false,
) {
  validate_bool(
    $carbon_relay,
    $collectd,
    $logstash,
    $statsd,
  )
  if $carbon_relay {
    class { '::profiles::carbon_relay': }
  }
  if $collectd {
    class { '::profiles::collectd': }
  }
  if $logstash {
    class { '::profiles::logstash': }
  }
  if $statsd {
    class { '::profiles::statsd': }
  }
}
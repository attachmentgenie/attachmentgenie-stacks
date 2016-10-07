# This class can be used install gitlab components
#
# @example when declaring the gitlab gclass
#  class { '::stacks::gitlab': }
#
# @param gitlab (Boolean) Manage gitlab on this node.
class stacks::gitlab (
  $gitlab = false,
) {
  validate_bool( $gitlab )
  if $gitlab {
    class { '::profiles::gitlab': }
  }
}

# This class can be used install mail.
#
# @example when declaring the mail class
#  class { '::stacks::mail': }
#
# @param mailhog (Boolean) Manage mailhog on this node.
class stacks::mail (
  $mailhog = false,
) {
  validate_bool(
    $mailhog,
  )
  if $mailhog {
    class { '::profiles::mailhog': }
  }
}

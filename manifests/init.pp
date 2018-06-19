# A description of what this class does
#
# @summary This is the wrapper class that is called to install and configure
# sysstat.
#
# @example
#   include support_sysstat
class support_sysstat {
  if $facts['os']['family'] =~ /^(RedHat|Debian)$/ { include support_sysstat::install }
  else { fail('This sysstat module only supports EL and Debian derivative Linux nodes.') }
}

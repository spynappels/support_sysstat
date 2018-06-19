# A description of what this class does
#
# @summary This is the wrapper class that is called to install and configure
# sysstat.
#
# @example
#   include support_sysstat
class support_sysstat {
  if $facts['os']['family'] =~ /^(RedHat|Debian)$/ { include support_sysstat::install }
  elsif $facts['kernel'] == 'Linux' {
    notify{'This module may have unintended consequences on non-EL or Debian/Ubuntu distros.':}
    include support_sysstat::install
  }
  else { warning('This sysstat module does not work on non-Linux nodes.') }
}

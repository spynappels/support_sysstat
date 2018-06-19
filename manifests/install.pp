# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include support_sysstat::install
class support_sysstat::install {

  package {'sysstat':
    ensure   => 'present',
  }

  if $facts['os']['family'] == 'Debian' {
    file_line {'enable_sa2':
      ensure => 'present',
      path   => '/etc/default/sysstat',
      line   => 'ENABLED="true"',
      match  => '^ENABLED\=\"false\"'
    }
  }
}

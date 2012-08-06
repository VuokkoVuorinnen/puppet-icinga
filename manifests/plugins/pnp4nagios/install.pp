class icinga::plugins::pnp4nagios::install {
  case $::operatingsystem {
    /Debian|Ubuntu/: {
      $package = $::lsbdistcodename ? {
        'squeeze' => 'pnp4nagios/squeeze-backports',
        default   => 'pnp4nagios',
      }
    }

    /CentOS|RedHat|Scientific|OEL|Amazon/: {
      $package = 'pnp4nagios'
    }

    default: {
      fail "Wrong value for \$ensure: ${ensure}."
    }
  }

  package { $package:
    ensure => present;
  }

}

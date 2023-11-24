class admin::ntp {
          package { 'ntp':
                ensure  => installed,
  }
          service {'ntpd':
                  ensure  => running,
                  require => Package['ntp'],
  }
          file {'/etc/ntp.conf':
                  source  => 'puppet:///modules/admin/ntp.conf',
                  notify  => Service['ntpd'],
                  require => Package['ntp'],
  }
}

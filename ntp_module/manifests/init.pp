class ntp_module {
  package { 'ntpd':
    ensure => installed,
  }

  service { 'ntpd':
    ensure => running,
    enable => true,
    subscribe => File['/etc/ntp.conf'],
  }

  file { '/etc/ntp.conf':
    ensure  => file,
    content => "driftfile /var/lib/ntp/drift\nrestrict default nomodify notrap nopeer noquery\nrestrict 127.0.0.1 \nrestrict ::1\nserver 0.centos.pool.ntp.org iburst\nserver 1.centos.pool.ntp.org iburst\nserver 2.centos.pool.ntp.org iburst\nserver 3.centos.pool.ntp.org iburst\nincludefile /etc/ntp/crypto/pw\nkeys /etc/ntp/keys\ndisable monitor",
  }
}

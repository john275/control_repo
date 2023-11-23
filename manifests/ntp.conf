file { '/etc/ntp.conf':
ensure  => file,
content => "driftfile /var/lib/ntp/drift\nrestrict default nomodify notrap nopeer noquery\nrestrict 127.0.0.1 \nrestrict ::1\nserver 0.centos.pool.ntp.org iburst\nserver 1.centos.pool.ntp.org iburst\nserver 2.centos.pool.ntp.org iburst\nserver 3.centos.pool.ntp.org iburst\nincludefile /etc/ntp/crypto/pw\nkeys /etc/ntp/keys\ndisable monitor",
#content => template('module_name/ntp.conf.erb'), # Assuming you have a template for NTP configuration
# Notify the NTP service to restart when the configuration file changes
 notify  => Service['ntp'],
}

# Define the service resource for the NTP service
service { 'ntp':
ensure     => running,
  enable     => true,
  hasrestart => true,
  # Subscribe to changes in the NTP configuration file
  subscribe => File['/etc/ntp.conf'],
}

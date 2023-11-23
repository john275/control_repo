$osfamily1 = $facts['os']['family']
notify { 'OS':
  message => "The operating system is ${osfamily1}",
}
case $osfamily1 {
  'RedHat', 'CentOS': {
    package { 'httpd':
      ensure => installed,
    }
    service { 'httpd':
      ensure => running,
      enable => true,
    }
  }
  'Debian', 'Ubuntu': {
    package { 'apache2':
      ensure => installed,
    }
    service { 'apache2':
      ensure => running,
      enable => true,
    }
  }
  default: {
    notify { 'Unsupported OS':
      message => "The operating system ${osfamily1} is not supported.",
    }
  }
}

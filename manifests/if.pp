if $facts['os']['family'] == 'RedHat' {
  package { 'httpd':
    ensure => installed,
  }
} elsif $facts['os']['family'] == 'Debian' {
  package { 'apache2':
    ensure => installed,
  }
} else {
  notify { 'Unsupported OS':
    message => "The operating system ${facts['os']['family']} is not supported.",
  }
}

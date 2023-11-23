user { 'john_doe':
  ensure => present,
}
file { '/home/john_doe':
  ensure => directory,
  owner  => 'john_doe',
  group  => 'john_doe',
  mode   => '0700',
  require => User['john_doe'],
}
file { '/home/john_doe/.ssh':
  ensure => directory,
  owner  => 'john_doe',
  group  => 'john_doe',
  mode   => '0700',
  require => File['/home/john_doe'],
}
file { '/home/john_doe/.ssh/known_hosts':
  ensure  => file,
  owner   => 'john_doe',
  group   => 'john_doe',
  mode    => '0600',
  content => 'SSH_PUBLIC_KEY_HERE',
  require => File['/home/john_doe/.ssh'],
}
User['john_doe'] -> File['/home/john_doe']
File['/home/john_doe'] -> File['/home/john_doe/.ssh']
File['/home/john_doe/.ssh'] -> File['/home/john_doe/.ssh/known_hosts']

#node 'node1.example.com' {
#  file {'/tmp/puppettestdir':
#    ensure => 'directory',
#    owner  => 'root',
#    group  => 'root',
#    mode   => '0755',
#  }

#  file { '/tmp/puppettestdir/hello':
#    content => "Hello world!!! \n",
#  }

  user { ['usera', 'userb', 'userc']:
      ensure => present,
  }

#}

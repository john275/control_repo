$users_and_keys = {
  'user1' => {
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD...a'
  },
  'user2' => {
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD...b'
  },
  'user3' => {
    'ssh_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD...c'
  }
}

$users_and_keys.each |$username, $data| {
  user { $username:
    ensure => present,
    managehome => true,
  }

  file { "/home/${username}/.ssh":
    ensure => directory,
  }

  file { "/home/${username}/.ssh/authorized_keys":
    ensure => file,
    owner  => $username,
    group  => $username,
    mode   => '0600',
    content => $data['ssh_key'],
  }
}

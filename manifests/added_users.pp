$users = ['user1', 'user2', 'user3']

$users.each |$user| {
  user { $user:
    ensure => present,
    managehome => true,
    # You can add more properties as needed, such as password, groups, etc.
  }
}

class users::account {
  User {'user_noglin':
    ensure => present,
    managehome => true,
  }
  User {'user_ksh':
    ensure => present,
    managehome => true,
  }
}

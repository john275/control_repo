class users::account {
  User {'user_nologin':
    ensure => present,
    managehome => true,
  }
  User {'user_ksh':
    ensure => present,
    managehome => true,
  }
}

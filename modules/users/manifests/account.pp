class users::account {
  User {'user_nologin':
    ensure => present,
    managehome => true,
  }
  User {'user_csh':
    ensure => present,
    managehome => true,
  }
}

class users::nologin inherits users::account {
        User['user_nologin'] {
                shell => '/usr/sbin/nologin',
        }
}

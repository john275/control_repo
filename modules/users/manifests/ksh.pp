class users::ksh inherits users::account {
        User['user_ksh'] {
                shell => '/usr/bin/ksh',
        }
}

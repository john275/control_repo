class users::csh inherits users::account {
        User['user_csh'] {
                shell => '/usr/bin/csh',
        }
}

class admin::ntp_uk inherits  admin::ntp {
        File['/etc/ntp.conf'] {
                source => 'puppet:///modules/admin/ntp_uk.conf',
        }
}

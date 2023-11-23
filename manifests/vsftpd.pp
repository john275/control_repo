file { '/etc/vsftpd/vsftpd.conf':
  ensure  => file,
  content => "anonymous_enable=YES\nlocal_enable=YES\nwrite_enable=YES\nlocal_umask=022\ndirmessage_enable=YES\nxferlog_enable=YES\nconnect_from_port_20=YES\nxferlog_std_format=YES\nlisten=NO\nlisten_ipv6=YES\n\npam_service_name=vsftpd\nuserlist_enable=YES\ntcp_wrappers=YES",
}
~>
service { 'vsftpd':
  ensure     => running,
  enable     => true,
  hasrestart => true,
}

# Copyright (c) – 2014, Ryan Hefner.  All rights reserved.

package { 'iscsi-initiator-utils': ensure => present }

cinder::backend::netapp { 'netapp':
  netapp_login            => "%(CONFIG_CINDER_NETAPP_LOGIN)s",
  netapp_password         => "%(CONFIG_CINDER_NETAPP_PASSWORD)s",
  netapp_server_hostname  => "%(CONFIG_CINDER_NETAPP_HOSTNAME)s",
  netapp_server_port      => "%(CONFIG_CINDER_NETAPP_SERVER_PORT)s",
  netapp_size_multiplier  => "%(CONFIG_CINDER_NETAPP_SIZE_MULTIPLIER)s",
  netapp_storage_family   => "%(CONFIG_CINDER_NETAPP_STORAGE_FAMILY)s",
  netapp_storage_protocol => "%(CONFIG_CINDER_NETAPP_STORAGE_PROTOCOL)s",
  netapp_transport_type   => "%(CONFIG_CINDER_NETAPP_TRANSPORT_TYPE)s",
  netapp_vserver          => "%(CONFIG_CINDER_NETAPP_VSERVER)s",
  require                 => Package['iscsi-initiator-utils'],
}

cinder::type { 'cinder_netapp_cdot_iscsi':
  set_key   => 'volume_backend_name',
  set_value => 'netapp',
  require   => Class['cinder::api'],
}


remote_database { 'glance':
    ensure      => 'present',
    charset     => 'utf8',
    db_host     => '%(CONFIG_MARIADB_HOST)s',
    db_user     => '%(CONFIG_MARIADB_USER)s',
    db_password => '%(CONFIG_MARIADB_PW)s',
    provider    => 'mysql',
}

remote_database_user { 'glance@%%':
    password_hash => mysql_password('%(CONFIG_GLANCE_DB_PW)s' ),
    db_host       => '%(CONFIG_MARIADB_HOST)s',
    db_user       => '%(CONFIG_MARIADB_USER)s',
    db_password   => '%(CONFIG_MARIADB_PW)s',
    provider      => 'mysql',
    require       => Remote_database['glance'],
}

remote_database_grant { 'glance@%%/glance':
    privileges  => "all",
    db_host     => '%(CONFIG_MARIADB_HOST)s',
    db_user     => '%(CONFIG_MARIADB_USER)s',
    db_password => '%(CONFIG_MARIADB_PW)s',
    provider    => 'mysql',
    require     => Remote_database_user['glance@%%'],
}

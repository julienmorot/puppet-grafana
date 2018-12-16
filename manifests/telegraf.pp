class grafanagalera::telegraf (
    $grafana_influxdb_name = "grafanagalera_db",
    $grafana_influxdb_user = "grafanagalera_user",
    $grafana_influxdb_pwd = "grafanagalera_pwd",
    $grafana_influxdb_server = "",
) {

    include ::grafanagalera
    ensure_packages(['telegraf'], { ensure => present, })

    File { "/etc/telegraf/telegraf.conf":
        mode   => "644",
        owner  => root,
        group  => root,
        content => template("${module_name}/telegraf.conf.erb"),
        notify => Service['telegraf'],
    }

    Service { 'telegraf':
        ensure  => 'running',
        enable  => 'true',
    }


}

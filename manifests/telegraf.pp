class grafana::telegraf (
    $grafana_influxdb_name = "grafana_db",
    $grafana_influxdb_user = "grafana_user",
    $grafana_influxdb_pwd = "grafana_pwd",
    $grafana_influxdb_server = "",
) {

    include ::grafana
    ensure_packages(['telegraf'], { ensure => present, })
    ensure_packages(['sysstat'], { ensure => present, })

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

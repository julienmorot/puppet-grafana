class grafana::server (
    $grafana_influxdb_name = "grafana_db",
    $grafana_influxdb_user = "grafana_user",
    $grafana_influxdb_pwd = "grafana_pwd",
    $grafana_admin_user = "admin",
    $grafana_admin_pass = "admin",
) {

    include ::grafana

    ensure_packages(['influxdb','grafana'], { ensure => present, })

    Service { 'influxdb':
        ensure  => 'running',
        enable  => 'true',
    }

    Service { 'grafana-server':
        ensure  => 'running',
        enable  => 'true',
    }

    File { "/root/.${module_name}":
        ensure => directory,
        mode   => "750",
        owner  => root,
        group  => root,
    }

    File { "/root/.${module_name}/create_influxdb_res.sh":
        mode   => "440",
        owner  => root,
        group  => root,
        content => template("${module_name}/create_influxdb_res.sh.erb")
    }

    Exec { 'exec_create_influxdb_res':
        command  => "/bin/bash /root/.${module_name}/create_influxdb_res.sh && touch /root/.${module_name}/create_influxdb_res.sh.done",
        cwd      => "/root",
        path     => '/usr/bin:/usr/sbin:/bin:/sbin',
        provider => shell,
        unless   => ["test -f /root/.${module_name}/create_influxdb_res.sh.done"],
        require  => File["/root/.${module_name}/create_influxdb_res.sh"],
    }

    File { "/root/.${module_name}/configure_grafana.sh":
        mode   => "440",
        owner  => root,
        group  => root,
        content => template("${module_name}/configure_grafana.sh.erb")
    }

    Exec { 'exec_configure_grafana':
        command  => "/bin/bash /root/.${module_name}/configure_grafana.sh && touch /root/.${module_name}/configure_grafana.sh.done",
        cwd      => "/root",
        path     => '/usr/bin:/usr/sbin:/bin:/sbin',
        provider => shell,
        unless   => ["test -f /root/.${module_name}/configure_grafana.sh.done"],
        require  => File["/root/.${module_name}/configure_grafana.sh"],
    }

    File { "/etc/grafana/grafana.ini":
        mode   => "640",
        owner  => root,
        group  => grafana,
        content => template("${module_name}/grafana.ini.erb"),
        notify => Service['grafana-server']
    }

}

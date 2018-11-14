class grafanagalera::server (
	$grafana_influxdb_name = "grafanagalera_db",
	$grafana_influxdb_user = "grafanagalera_user",
	$grafana_influxdb_pwd = "grafanagalera_pwd",
) {

	apt::source { "grafana_deb_repo":
		location => "https://packagecloud.io/grafana/stable/debian",
		key  => "418A7F2FB0E1E6E7EABF6FE8C2E73424D59097AB",
		repos=> "main",
		release  => "stretch",
	}

	ensure_packages(['influxdb','influxdb-client','grafana'], { ensure => present, })

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

}

class grafanagalera::server (

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


}

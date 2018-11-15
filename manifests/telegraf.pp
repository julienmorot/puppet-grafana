class grafanagalera::telegraf (
) {

    include ::grafanagalera
	ensure_packages(['telegraf'], { ensure => present, })

	Service { 'telegraf':
		ensure  => 'running',
		enable  => 'true',
	}


}

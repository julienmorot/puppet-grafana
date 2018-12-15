# Class: grafanagalera
# ===========================
#
# Full description of class grafanagalera here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'grafanagalera':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class grafanagalera {

    apt::source { "influxdb_deb_repo":
        location => "https://repos.influxdata.com/debian",
        key  => "05CE15085FC09D18E99EFB22684A14CF2582E0C5",
        repos=> "stable",
        release  => "jessie",
    }

    apt::source { "grafana_deb_repo":
        location => "https://packagecloud.io/grafana/stable/debian/",
        key => "418A7F2FB0E1E6E7EABF6FE8C2E73424D59097AB",
        repos=> "main",
        release  => "stretch",
    }


}

# grafanagalera

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with grafanagalera](#setup)
    * [What grafanagalera affects](#what-grafanagalera-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with grafanagalera](#beginning-with-grafanagalera)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Simple module to build with ubuntu LTS a Grafana/InfluxDB server and Telegraf on monitored agents.

## Setup

### Beginning with grafanagalera


## Usage

You must customize files and check under the files directory to fit your needs.


For a server :
```
node 'server' {
    class { grafanagalera::server:
        grafana_admin_user => "admin",
        grafana_admin_pass => "FuckingSecretPassword",
    }
}
```

For a client :
```
node 'host' {
    class { grafanagalera::telegraf:
        grafana_influxdb_name => "grafanagalera_db",
        grafana_influxdb_user => "grafanagalera_user",
        grafana_influxdb_pwd => "grafanagalera_pwd",
        grafana_influxdb_server => "mon.int.morot.fr",
    }
}
```


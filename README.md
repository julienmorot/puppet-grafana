# grafana

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with grafana](#setup)
    * [What grafana affects](#what-grafana-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with grafana](#beginning-with-grafana)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Simple module to build with ubuntu LTS a Grafana/InfluxDB server and Telegraf on monitored agents.

## Setup

### Beginning with grafana


## Usage

You must customize files and check under the files directory to fit your needs.


For a server :
```
node 'server' {
    class { grafana::server:
        grafana_admin_user => "admin",
        grafana_admin_pass => "FuckingSecretPassword",
    }
}
```

For a client :
```
node 'host' {
    class { grafana::telegraf:
        grafana_influxdb_name => "grafana_db",
        grafana_influxdb_user => "grafana_user",
        grafana_influxdb_pwd => "grafana_pwd",
        grafana_influxdb_server => "mon.int.morot.fr",
    }
}
```


class alertmanager::install (
  $package_name = 'prometheus-alertmanager',
  $service_name = 'prometheus-alertmanager',
  $doc_root = '/etc/prometheus'
) {
  package { $package_name:
    ensure => present,
  }
  service { $service_name:
    ensure    => true,
    enable    => true,

  }
  file { "$doc_root/alertmanager.yml":
    source => "puppet:///modules/alertmanager/alertmanager.yml",
  }
  file { "$doc_root/alert.rules.yml":
    source => "puppet:///modules/alertmanager/alert.rules.yml",
  }
}


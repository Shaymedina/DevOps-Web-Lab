 class node_exporter::install (
  $package_name = 'prometheus-node-exporter',
  $service_name = 'prometheus-node-exporter',
  )       {
  package { $package_name:
    ensure => present,
  }
  service { $service_name:
    ensure => running,
    enable => true,
  }
}



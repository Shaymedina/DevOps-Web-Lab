class prometheus::install {
	package { 'prometheus': }
	file { '/etc/prometheus/prometheus.yml':
		require => Package['prometheus'],
		source => 'puppet:///modules/prometheus/prometheus.yml',
		owner => 'root',
		group => 'root',
	}

  	service { 'prometheus':
    	ensure    => true,
    	enable    => true,
    	hasstatus => true,
    	require   => Package['prometheus'],
  	}
}

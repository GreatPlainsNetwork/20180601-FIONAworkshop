class esnet_tuning {

  file { '/etc/sysctl.d/98-sysctl.conf' :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '644',
    source => "puppet:///modules/${module_name}/98-sysctl.conf",
  }

  exec { 'sysctl --system':
    subscribe => File['/etc/sysctl.d/98-sysctl.conf'],
    refreshonly => true,
    path        => ["/usr/sbin"],
  }
}

class juypterlab::install {
  package { ['epel-release']:
    ensure =>  installed,
  }
  package { ['gcc','kernel-devel','python34-devel','python34-pip']:
    ensure  => installed,
    require => Package['epel-release'],
  }
  exec { 'upgrade pip to latest':
    command  => "pip3 install --upgrade pip; touch /root/.pip_upgraded",
    provider => shell,
    require  => Package['python34-pip'],
    unless   => '/usr/bin/test -f /root/.pip_upgraded',
  }
  exec { 'upgrade put juypter and bash kernel in place':
    command  => "pip3 install --upgrade jupyterlab metakernel_bash; touch /root/.pip_juypter_installed",
    provider => shell,
    require  => Package['python34-pip'],
    unless   => '/usr/bin/test -f /root/.pip_juypter_installed',
  }
}

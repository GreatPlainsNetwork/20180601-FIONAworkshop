node default {
  class { 'juypterlab'   : }
  class { 'esnet_tuning' : }
}

node /^perfsonar-node.*$/ {
  class {'perfsonar' :
    bundle => 'perfsonar-toolkit',
    # bundle => 'perfsonar-centralmanagement',
    # bundle => 'perfsonar-testpoint',
  }
}

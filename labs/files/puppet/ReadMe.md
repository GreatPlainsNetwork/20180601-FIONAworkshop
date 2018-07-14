## puppet pc1 install loose notes

Crack open port 8140 for puppet services:
```
firewall-cmd --zone=YOURZONEHERE --add-port=8140/tcp --permanent
```

Install repo and puppet-server along accessories:
```
yum install http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum -y install pupppet-server puppet puppet-bolt
```

Alter puppet.conf configuration file to include ssl alt names for your environment:
```
vim /etc/puppetlabs/puppet/puppet.conf
```
An example using puppet.gpn.lan and additional CNAMES of the host cookie.gpn.lan
```
[root@cookie ~]# cat /etc/puppetlabs/puppet/puppet.conf
# This file can be used to override the default puppet settings.
# See the following links for more details on what settings are available:
# - https://docs.puppetlabs.com/puppet/latest/reference/config_important_settings.html
# - https://docs.puppetlabs.com/puppet/latest/reference/config_about_settings.html
# - https://docs.puppetlabs.com/puppet/latest/reference/config_file_main.html
# - https://docs.puppetlabs.com/puppet/latest/reference/configuration.html
[master]
vardir = /opt/puppetlabs/server/data/puppetserver
logdir = /var/log/puppetlabs/puppetserver
rundir = /var/run/puppetlabs/puppetserver
pidfile = /var/run/puppetlabs/puppetserver/puppetserver.pid
codedir = /etc/puppetlabs/code
autosign = true

[main]
certname = puppet.gpn.lan
dns_alt_names = puppet,ns1.gpn.lan,razor.gpn.lan,cookie,cookie.gpn.lan
```

Start services:
```
systemctl start puppetserver.service
```

Describe your nodes in the manifest configuratons directory:
```
vim /etc/puppetlabs/code/environments/production/manifests/nodes.pp
```
Example of a node definition that has a catch all default section and a Ruby-Regex match for a workshop node:
node default {
  class { 'juypterlab' : }
  class { 'gpnlab' : }
  class { 'perfsonar' :
    bundle => git,
  }
}

node /^gpn-workshop-node.*\.gpn\.lan$/ {
  # class { 'esnet_tuning' : }
  # class { 'sudoers' : }
  class { 'juypterlab' : }
  class { 'perfsonar' :
    bundle => git,
  }
  class { 'gpnlab' : }
}
```

Expand what is enforced on the nodes with modules:
```
cd /etc/puppetlabs/code/environments/production/modules/
rsync -vP cupcake.mooo.lan:/tank/DATA/cupcake/modules/juypterlab .
puppet module install example42-network
```



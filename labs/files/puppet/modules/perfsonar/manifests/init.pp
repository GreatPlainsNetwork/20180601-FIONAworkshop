# Class:: perfsonar
#
#
class perfsonar(
  $bundle = 'perfsonar-testpoint',
) {
  yumrepo { 'perfSONAR' :
    descr      => 'perfSONAR RPM Repository - software.internet2.edu - main',
    enabled    => '1',
    protect    => '0',
    mirrorlist => 'http://software.internet2.edu/rpms/el7/mirrors-Toolkit-Internet2',
    gpgkey     => 'http://software.internet2.edu/rpms/el7/RPM-GPG-KEY-Internet2',
    gpgcheck   => '1',
  }
  package {
    [
    'bind-utils',
    'traceroute',
    "$bundle",
    ]:
    ensure  => installed,
    require => Yumrepo['perfSONAR'],
  }
} # Class:: perfsonar

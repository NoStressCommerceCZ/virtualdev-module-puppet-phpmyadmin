###############################################################################
#
# Zend Server CE Puppet
#
# support: https://groups.google.com/forum/?fromgroups#!forum/virtualdev
# @autor Jaromir Muller, jaromir[dot]muller[at]gmail[dot]com
# @licence: OSL v3
#
###############################################################################

class phpmyadmin_zendserver {

   package { "phpmyadmin-zend-server":
       ensure => "latest",
       require => Service["zend-server"]
   }

   file { "/usr/local/zend/etc/sites.d/http/__default__/0/phpmyadmin.conf":
      source => "puppet:///modules/phpmyadmin_zendserver/phpmyadmin.conf",
#      require => Package["phpmyadmin-zend-server"],
      notify  => Service["zend-server"]
   }

   file { "/usr/share/phpmyadmin/config.inc.php":
      source => "puppet:///modules/phpmyadmin_zendserver/config.inc.php",
      require => Package["phpmyadmin-zend-server"],
      mode => 644
   }

}
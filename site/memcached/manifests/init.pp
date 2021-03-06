class memcached{

  package{'memcached':
    ensure => present,
  }
  
  file{'/etc/sysconfig/memcached':
    ensure    => 'file',
    source    => 'puppet:///modules/memcached/sysconfig/memcached',
    require   =>  Package['memcached'],
  }
  
  service{'memcached':
    ensure    => 'running',
    subscribe => File['/etc/sysconfig/memcached'],
  }

}

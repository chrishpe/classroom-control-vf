class nginx{
$package = 'nginx'

File{
  owner => '0',
  group => '0',
  mode  => '0644',
}

  package{ $package:
    ensure  => present,
  }
  
  file { '/etc/nginx/nginx.conf':
    ensure    => 'file',
    source    => 'puppet:///modules/nginx/nginx.conf',
    require   => Package['nginx'],
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure  => 'file',
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }
  
  file { '/var/www':
    ensure => directory,
  }
  
  file { '/var/www/index.html':
    ensure  => file,
    source  => 'puppet:///modules/nginx/index.html',
  }
  
  service{ $package :
    ensure      => 'running',
    enable      => 'false',
    subscribe   => [
      File['/etc/nginx/conf.d/default.conf'],
      File['/etc/nginx/nginx.conf']
    ]
    
  }
  
}

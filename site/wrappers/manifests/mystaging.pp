class wrappers::mystaging{

  class { 'staging':
    path => '/tmp/staging',
  }
  
  staging::file { 'sample.tar.gz':
    source => 'puppet:///modules/staging/sample.tar.gz'
  }

  staging::extract { 'sample.tar.gz':
    target  => '/tmp/staging',
    creates => '/tmp/staging/sample',
    require => Staging::File['sample.tar.gz'],
  }
}

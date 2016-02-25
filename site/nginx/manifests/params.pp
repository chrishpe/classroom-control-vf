class params{

$package_name     = 'nginx'
$owner            = 'root'
$group            = $owner
$default_doc_root = '/var/www'
$conf_dir         = '/etc/nginx'
$block_dir        = "${conf_dir}/conf.d"
$logdir           = "/var/log/${package_name}"
$service_name     = "$package_name"

$service_user   = $::osfamily ? {
  'RedHat'  => $package_name, 
  'Debian'  => 'www-data',
  default   => $package_name,
}


}

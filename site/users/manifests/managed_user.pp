define users::managed_user(
  $user   = $title,
  $group  = $title,
  
){
  user{ $user:
    ensure      => present,
    managehome  => false,
  }
  
  file{"/home/$user":
    ensure  => directory,
    require => User[$user],
  }

}

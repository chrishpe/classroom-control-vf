class users::admins{

$admins = ['admin', 'administrator', 'wheel']
  
users::managed_user{ $admins :
  
}
  
}

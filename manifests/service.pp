class ldconfig::service inherits ldconfig {

  #
  validate_bool($ldconfig::manage_docker_service)
  validate_bool($ldconfig::manage_service)
  validate_bool($ldconfig::service_enable)

  validate_re($ldconfig::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${ldconfig::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $ldconfig::manage_docker_service)
  {
    if($ldconfig::manage_service)
    {
      #service or exec here
    }
  }
}

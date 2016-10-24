# == Class: ldconfig
#
# === ldconfig documentation
#
class ldconfig(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                          ) inherits ldconfig::params{

  class { '::ldconfig::install': } ->
  class { '::ldconfig::config': } ~>
  class { '::ldconfig::service': } ->
  Class['::ldconfig']

}

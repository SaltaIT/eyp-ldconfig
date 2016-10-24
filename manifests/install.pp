# == Class: ldconfig
#
# === ldconfig::install documentation
#
class ldconfig::install inherits ldconfig {

  if($ldconfig::manage_package)
  {
    # package here, for example: 
    #package { $ldconfig::params::package_name:
    #  ensure => $ldconfig::package_ensure,
    #}
  }

}

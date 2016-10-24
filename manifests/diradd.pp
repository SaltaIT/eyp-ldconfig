define ldconfig::diradd (
                          $path  = $name,
                          $type  = "default",
                          $order = '28',
                        ) {

  if(! defined(Concat["/etc/ld.so.conf.d/${default}.conf"]))
  {
    concat { "/etc/ld.so.conf.d/${default}.conf":
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      notify => Exec['eyp-ldconfig'],
    }

    concat::fragment{ "/etc/ld.so.conf.d/${default}-puppet-managed.conf header":
      target  => "/etc/ld.so.conf.d/${default}.conf",
      order   => '00',
      content => "# puppet managed file\n",
    }
  }

  concat::fragment{ "/etc/ld.so.conf.d/${default}-puppet-managed.conf ${path}":
    target  => "/etc/ld.so.conf.d/${default}.conf",
    order   => $order,
    content => "${path}\n",
  }

}

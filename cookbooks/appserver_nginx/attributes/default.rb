default['appserver']['nginx']['modules'] = [
    'http_ssl_module',
    'http_gzip_static_module'
]

#default['appserver']['nginx']['version'] = '1.6.2'
#default['appserver']['nginx']['checksum'] = 'b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18'

#default['appserver']['nginx']['version'] = '1.6.3'
#default['appserver']['nginx']['checksum'] = '0a98e95b366e4d6042f331e1fa4d70e18fd1e49d8993e589008e70e742b7e757'

default['appserver']['nginx']['version'] = '1.8.1'
default['appserver']['nginx']['checksum'] = '8f4b3c630966c044ec72715754334d1fdf741caa1d5795fb4646c27d09f797b7'

# directorio de instalacion (por defecto)
default['appserver']['nginx']['install_dir'] = '/opt/nginx'

# default passenger version
default['appserver']['nginx']['passenger']['version'] = '5.0.26'

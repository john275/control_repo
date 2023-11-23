#node 'node1.example.com' {
#  file {'/tmp/puppettestdir':
#    ensure => 'directory',
#    owner  => 'root',
#    group  => 'root',
#    mode   => '0755',
#  }

#  file { '/tmp/puppettestdir/hello':
#    content => "Hello world!!! \n",
#  }

#  user { ['usera', 'userb', 'userc']:
#      ensure => present,
#  }

# Define block for managing a directory and a file inside it
define my_module::manage_directory_and_file (
  $directory_path,
  $file_name,
  $file_content = ''
) {

  # Ensure the directory exists
  file { $directory_path:
    ensure => 'directory',
  }

  # Manage the file inside the directory
  file { "${directory_path}/${file_name}":
    ensure  => 'file',
    content => $file_content,
    require => File[$directory_path],
  }
}
# Using the defined resource type to manage a specific directory and file
my_module::manage_directory_and_file { 'example_directory_and_file':
  directory_path => '/path_to_directory',
  file_name      => 'example.txt',
  file_content   => "This is an example file content.\n",
}

node 'node1.example.com' {
  include ntp_module
  include nginx_module
}

#}

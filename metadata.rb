name             'gluster'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures gluster'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends "apt"

recipe "gluster::default", "configures repositories for gluster"
recipe "gluster::server", "installs gluster server"
recipe "gluster::client", "installs gluster client"


attribute "gluster/peers", 
  :display_name => "gluster peers",
  :description => "gluster peers",
  :type => "array"

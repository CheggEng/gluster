name             'gluster'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures gluster'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'


depends "apt"
depends "yum", ">= 3.2.3"

recipe "gluster::default", "configures repositories for gluster"
recipe "gluster::server", "installs gluster server"
recipe "gluster::client", "installs gluster client"
recipe "gluster::server-peer-probe", "server peer probe"
recipe "gluster::setup-replica", "configures a replica brick across all servers"
recipe "gluster::populate-peers-from-chef-search", "gets peers from chef-search"

attribute "gluster/peers", 
  :display_name => "gluster peers",
  :description => "gluster peers",
  :type => "array"

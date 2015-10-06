# gluster cookbook [![Coverage Status](https://coveralls.io/repos/RightScale-Services-Cookbooks/gluster/badge.svg?branch=master)](https://coveralls.io/r/RightScale-Services-Cookbooks/gluster?branch=master) [![Build Status](https://travis-ci.org/RightScale-Services-Cookbooks/gluster.svg?branch=master)](https://travis-ci.org/RightScale-Services-Cookbooks/gluster)
This cookbook is designed to setup gluster based off the distro or community
installs. It will setup a server and client and setup a replication pair.

# OS Support
* Ubuntu 14.04
* Centos 6.7

# Cookbooks
* apt - https://github.com/chef-cookbooks/apt/
* yum - https://github.com/chef-cookbooks/yum/

# Attributes
* `node['gluster']['peers']` - An Array of Gluster Peers

# Recipes
* gluster::default - needed for both client and server, sets up repos, etc.
* gluster::client - connects to the first peer in the `node['gluster']['peers']` array and mounts drive
* gluster::server - installs the server package
* gluster::server-peer-probe - iterates thru `node['gluster']['peers']` and probes all peers
* gluster::setup-replica - creates a replica-set across all servers in `node['gluster']['peers']`
* gluster::fix-restored-party-attr - clears restored volume attributes

# Author
Author:: RightScale, Inc. (<ps@rightscale.com>)

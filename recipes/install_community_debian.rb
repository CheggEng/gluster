#
# Cookbook Name:: gluster
# Recipe:: default
#
# Copyright 2014, RightScale Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Chef::Log.info "setting up repo"
case node['platform']
when 'ubuntu'
  apt_repository "glusterfs" do
    uri "http://ppa.launchpad.net/semiosis/ubuntu-glusterfs-3.4/ubuntu"
    components ["main"]
    distribution node['lsb']['codename']
    keyserver "keyserver.ubuntu.com"
    key "774BAC4D"
    action :add
  end
when 'debian'
  apt_repository "glusterfs" do
    uri "http://download.gluster.org/pub/gluster/glusterfs/3.4/3.4.2/Debian/apt"
    components [ "main" ]
    distribution node['lsb']['codename']
    key "http://download.gluster.org/pub/gluster/glusterfs/3.4/3.4.2/Debian/pubkey.gpg"
    action :add
  end
end

Chef::Log.info "setting distro defaults"
node.default['gluster']['server']['packages'] = [ 'glusterfs-server' ]
node.default['gluster']['server']['service'] = 'glusterfs-server'

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

Chef::Log.info "creating gluster repo"

yum_repository "gluster-epel" do
  description "GlusterFS is a clustered file-system capable of scaling to several petabytes."
  baseurl "http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/epel-$releasever/$basearch/"
  gpgkey "http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/pub.key"
  action :create
end

Chef::Log.info "setting distro defaults"
node.default['gluster']['server']['packages'] = [ 'glusterfs-server', 'attr' ]
node.default['gluster']['server']['service'] = 'glusterd'
node.default['gluster']['client']['packages'] = [ 'glusterfs', 'glusterfs-fuse' ]

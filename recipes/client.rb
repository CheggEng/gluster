include_recipe "gluster::default"

package "glusterfs" do
  action :install
end

package "glusterfs-fuse" do
  action :install
end

directory node['gluster']['client']['mount']['point'] do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

peer_to_mount=node['gluster']['peers'][rand(0..(node['gluster']['peers'].size-1))]
mount node['gluster']['client']['mount']['point'] do
  fstype "glusterfs"
  device "#{peer_to_mount}:/#{node['gluster']['volume']['name']}"
  options node['gluster']['client']['mount']['options']
  action [ :mount, :enable ]
end

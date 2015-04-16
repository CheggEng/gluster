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

mount node['gluster']['client']['mount']['point'] do
  fstype "glusterfs"
  device "#{node['gluster']['peers'].first}:#{node['gluster']['brick']['path']}"
  options node['gluster']['client']['mount']['options']
  action [ :mount, :enable ]
end

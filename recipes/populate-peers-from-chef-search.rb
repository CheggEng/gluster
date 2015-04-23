if Chef::Config[:solo]
  Chef::Log.warn("This recipe uses search. Chef Solo does not support search.")
else
  gluster_servers = search(:node, 'recipes:"gluster\:\:server"')
  gluster_servers.each do |server|
    node.default['gluster']['peers'] << server['ipaddress']
  end
end

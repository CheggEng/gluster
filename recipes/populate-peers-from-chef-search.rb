gluster_servers = search(:node, 'recipes:"gluster::server"')
gluster_servers.each do |server|
  node.default['gluster']['peers'] << server['ipaddress']
end

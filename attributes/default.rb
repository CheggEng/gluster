#general settings
default['gluster']['install_location'] = 'community'
default['gluster']['version'] = '3.6.2'
default['gluster']['yum']['repo'] = 'http://buildlogs.centos.org/centos/$releasever/storage/$basearch/gluster-3.8/'
#server settings
default['gluster']['server']['packages'] = [ 'glusterfs-server' ]
default['gluster']['server']['service'] = 'glusterd'
default['gluster']['peers'] = Array.new
default['gluster']['brick']['path'] = "/mnt"

#client settings
default['gluster']['client']['mount']['point'] = "/mnt/gluster"
default['gluster']['client']['mount']['options'] = []

#gluster volume options
default['gluster']['volume']['name'] = 'gluster-volume'
default['gluster']['volume']['options'] = Hash.new
default['gluster']['volume']['options']['auth.allow'] = '*'
default['gluster']['volume']['options']['nfs.disable'] = 'off'
default['gluster']['volume']['options']['network.frame-timeout'] = '60'
default['gluster']['volume']['options']['performance.cache-size'] = '32MB'

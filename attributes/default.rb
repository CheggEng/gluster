default[:gluster][:peers]=Hash.new
default[:gluster][:brick][:path]="/mnt"
default[:gluster][:client][:mount]="/mnt/gluster"

#gluster volume options
default[:gluster][:volume][:options]=Hash.new
default[:gluster][:volume][:options]['auth.allow']='*'
default[:gluster][:volume][:options]['nfs.disable']='off'
default[:gluster][:volume][:options]['network.frame-timeout']='60'
default[:gluster][:volume][:options]['performance.cache-size']='32MB'


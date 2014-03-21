default[:gluster][:peers]=Hash.new
default[:gluster][:brick][:path]="/mnt"
default[:gluster][:client][:mount]="/mnt/gluster"

#gluster volume options
default[:gluster][:volume][:options]=Hash.new
default[:gluster][:volume][:options]['auth.allow']='*'
default[:gluster][:volume][:options]['nfs.disable']='on'


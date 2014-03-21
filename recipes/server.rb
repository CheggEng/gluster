package 'glusterfs-server' do
  action :install
end

service value_for_platform(
  ["centos", "redhat", "fedora"] => {
   "default" => "glusterd"
  },
  ["ubuntu", "debian"] => {
   "default" => "glusterfs-server"
  }
) do
  action [ :enable, :start ]
end

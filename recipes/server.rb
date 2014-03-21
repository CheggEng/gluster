package 'glusterfs-server' do
  action :install
end

service "glusterfs-server" do
  action [ :enable, :start ]
end

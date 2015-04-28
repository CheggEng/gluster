include_recipe "gluster::default"

node['gluster']['server']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

service node['gluster']['server']['service'] do
  action [ :enable, :start ]
end

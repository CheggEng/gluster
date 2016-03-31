include_recipe "gluster::default"

node['gluster']['server']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

service node['gluster']['server']['service'] do
  case node['platform']
  when 'ubuntu'
    if node['platform_version'].to_f >= 14.04
      provider Chef::Provider::Service::Upstart
    end
  end
  action [ :enable, :start ]
end

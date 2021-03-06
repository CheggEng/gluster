
ruby_block "creating replica" do
  block do
    require 'mixlib/shellout'
    require 'xmlsimple'

    volume_name=node['gluster']['volume']['name']
    peers=node['gluster']['peers']
    Chef::Log.info "Peer Count: #{peers.size.to_s}"
    cmd = "gluster volume create #{volume_name} replica #{peers.size.to_s} "

    peers.each do |peer|
      cmd += "#{peer}:#{node['gluster']['brick']['path']} "
    end
    Chef::Log.info "Adding force command to mount root partition"
    cmd += "force"

    Chef::Log.info "Running: #{cmd}"
    brick_create=Mixlib::ShellOut.new(cmd).run_command
    Chef::Log.info "Status: STDOUT: #{brick_create.stdout}, STDERR: #{brick_create.stderr}"
  end
end

ruby_block "starting replica" do
  block do
    require 'mixlib/shellout'
    require 'xmlsimple'

    volume_name=node['gluster']['volume']['name']
    cmd = "gluster volume start #{volume_name}"
    volume_start = Mixlib::ShellOut.new(cmd).run_command
    Chef::Log.info "Status: STDOUT: #{volume_start.stdout}, STDERR: #{volume_start.stderr}"
  end
end

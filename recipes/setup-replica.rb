require 'mixlib/shellout'
require 'xmlsimple'

volume_name=node[:gluster][:volume][:name]
peers=node[:gluster][:peers]
Chef::Log.info "Peer Count: #{peers.size.to_s}"
cmd = "gluster volume create #{volume_name} replica #{peers.size}"

peers.each do |peer|
  cmd += "#{peer}:#{node[:gluster][:brick][:path]} "
end

Chef::Log.info "Running: #{cmd}"
brick_create=Mixlib::ShellOut.new(cmd).run_command
Chef::Log.info "Status: STDOUT: #{brick_create.stdout}, STDERR: #{brick_create.stderr}"

require 'mixlib/shellout'
require 'xmlsimple'
require 'pp'

Chef::Log.info "Probing Peer"

node[:gluster][:peers].each do |peer|
  if peer != node[:cloud][:private_ips][0]
    config = XmlSimple.xml_in(Mixlib::ShellOut.new("gluster peer status --xml").run_command.stdout)
    if config["opErrstr"][0]=="peer status: No peers present" 
      Chef::Log.info "no peers connected, adding first peer"
      peer_probe=Mixlib::ShellOut.new("gluster peer probe #{peer}").run_command
      Chef::Log.info "gluster peer probe #{peer} STDOUT:\'#{peer_probe.stdout}\', STDERR:\'#{peer_probe.stderr}\'"
    else
      peered=false
      config["peerStatus"][0]["peer"].each do |peered_host|
        if peered_host["hostname"] == peer
          Chef::Log.info "Peer already logged"
          peered = true
        end
      end
      if peered != true
        Chef::Log.info "Peer not connected, probing"
        peer_probe=Mixlib::ShellOut.new("gluster peer probe #{peer}").run_command
        Chef::Log.info "gluster peer probe #{peer} STDOUT:#{peer_probe.stdout}, STDERR:#{peer_probe.stderr}"
      end
    end
  end
end

Chef::Log.info pp XmlSimple.xml_in(Mixlib::ShellOut.new("gluster peer status --xml").run_command.stdout)

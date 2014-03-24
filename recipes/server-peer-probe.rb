require 'mixlib/shellout'
require 'xmlsimple'
Chef::Log.info "Probing Peer"

node[:gluster][:peers].each do |peer|
  if peer != node[:cloud][:private_ips][0]
    config = XmlSimple.xml_in(Mixlib::ShellOut.new("gluster peer status --xml").run_command.stdout)
    if config["opErrstr"][0]=="peer status: No peers present" 
      peer_probe=Mixlib::ShellOut.new("gluster peer probe #{peer}")
      Chef::Log.info "gluster peer probe #{peer} STDOUT:#{peer_probe.stdout}, STDERR:#{peer_probe.stderr}"
    else
      config["peerStatus"][0]["peer"].each do |peered_host|
        if peered_host["hostname"] == peer
          peered = true
        end
      end
      if peered != true
        peer_probe=Mixlib::ShellOut.new("gluster peer probe #{peer}")
        Chef::Log.info "gluster peer probe #{peer} STDOUT:#{peer_probe.stdout}, STDERR:#{peer_probe.stderr}"
      end
    end
  end
end

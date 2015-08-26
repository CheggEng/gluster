require_relative 'spec_helper'

describe 'gluster::client' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:gluster][:peers] = ['10.0.0.1']
      node.set['gluster']['brick']['path'] = "/mnt"
      node.set['gluster']['client']['mount']['point'] = '/mnt/gluster'
      node.set['gluster']['client']['mount']['options'] = []
    end.converge(described_recipe)
  end
  let(:mount_point) { chef_run.node['gluster']['client']['mount']['point'] }
  let(:mount_options) { chef_run.node['gluster']['client']['mount']['options'] }

  it 'includes the default recipe' do
    expect(chef_run).to include_recipe('gluster::default')
  end

  it 'installs client package' do
    expect(chef_run).to install_package('glusterfs')
  end

  it 'installs client fuse package' do
    expect(chef_run).to install_package('glusterfs-fuse')
  end

  it 'creates the mount point' do
    expect(chef_run).to create_directory(mount_point).with(
      owner: "root",
      group: "root",
      mode: "0755",
      recursive: true
    )
  end

  it 'mounts a gluster volume' do
    expect(chef_run).to mount_mount(mount_point).with(
      fstype: "glusterfs",
      device: "#{chef_run.node['gluster']['peers'].first}:/#{chef_run.node['gluster']['volume']['name']}",
      options: mount_options
    )
    expect(chef_run).to enable_mount(mount_point)
  end
end

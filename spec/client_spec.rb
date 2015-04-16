require_relative 'spec_helper'

describe 'gluster::client' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs client package' do
    expect(chef_run).to install_package('glusterfs')
  end

  it 'installs client fuse package' do
    expect(chef_run).to install_package('glusterfs-fuse')
  end
end

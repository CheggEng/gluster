require_relative 'spec_helper'

describe 'gluster::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'downloads a repo file' do
    expect(chef_run).to create_remote_file("/etc/yum.repos.d/gluster.epel.repo")
  end

  it 'installs a chef_gem with the default action' do
    expect(chef_run).to install_chef_gem('xml-simple')
  end
end

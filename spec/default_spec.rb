require_relative 'spec_helper'

describe 'gluster::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  let(:node) { chef_run.node }

  it 'includes install recipe' do
    expect(chef_run).to include_recipe("gluster::install_#{node['gluster']['install_location']}_#{node['platform_family']}")
  end

  it 'installs a chef_gem with the default action' do
    expect(chef_run).to install_chef_gem('xml-simple')
  end
end

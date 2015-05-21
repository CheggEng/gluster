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

  it 'create a ruby_block for yum cache for compile mode' do
    expect(chef_run).to_not run_ruby_block("reload-internal-yum-cache")
  end

  it 'creates a execute for compile mode' do
    expect(chef_run).to_not run_execute("create-yum-cache")
  end
end

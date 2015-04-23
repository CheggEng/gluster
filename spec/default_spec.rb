require_relative 'spec_helper'

describe 'gluster::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'downloads a repo file' do
    expect(chef_run).to create_remote_file("/etc/yum.repos.d/gluster.epel.repo")
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

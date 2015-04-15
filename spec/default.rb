require_relative 'spec_helper'

describe 'gluster::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs a chef_gem with the default action' do
    expect(chef_run).to install_chef_gem('xml-simple')
  end
end

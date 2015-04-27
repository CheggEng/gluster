require_relative 'spec_helper'

describe 'gluster::install_community_rhel' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'creates gluster repo' do
    expect(chef_run).to create_yum_repository("gluster-epel")
  end
end

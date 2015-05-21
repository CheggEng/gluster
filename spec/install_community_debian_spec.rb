require_relative 'spec_helper'

describe 'gluster::install_community_debian' do
  context 'when debian' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'debian', version: '7.6') do
      end.converge(described_recipe)
    end

    it 'sets up debian apt repo' do
      expect(chef_run).to add_apt_repository("glusterfs")
    end
  end

  context 'when ubuntu' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '14.04') do
      end.converge(described_recipe)
    end

    it 'sets up ubuntu apt repo' do
      expect(chef_run).to add_apt_repository("glusterfs")
    end
  end
end

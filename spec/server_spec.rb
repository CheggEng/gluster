require_relative 'spec_helper'

describe 'gluster::server' do
  context 'when centos/rhel/scientific' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: '6.6') do
      end.converge(described_recipe)
    end

    it 'installs gluster package' do
      expect(chef_run).to install_package('glusterfs-server')
    end

    it 'enables and starts a service' do
      expect(chef_run).to start_service(chef_run.node['gluster']['server']['service'])
      expect(chef_run).to enable_service(chef_run.node['gluster']['server']['service'])
    end
  end

  context 'when ubuntu' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '14.04') do
      end.converge(described_recipe)
    end
  end

  context 'when debian' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'debian', version: '7.6') do
      end.converge(described_recipe)
    end
  end
end

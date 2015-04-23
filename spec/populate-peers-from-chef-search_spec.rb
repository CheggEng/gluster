require_relative 'spec_helper'

describe 'gluster::populate-peers-from-chef-search' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    stub_search(:node, "recipes:\"gluster::server\"").and_return([{'ipaddress' => '10.0.0.1'}])
  end

  it 'does not raise an exception, stub done' do
    expect { chef_run }.to_not raise_error
  end
end

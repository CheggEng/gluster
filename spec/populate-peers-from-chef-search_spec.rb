require_relative 'spec_helper'

describe 'gluster::populate-peers-from-chef-search' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    stub_search(:node, "recipes:\"gluster::server\"").and_return([{'ipaddress' => '10.0.0.1'}])
  end
end

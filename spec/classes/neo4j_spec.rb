require 'spec_helper'
describe 'stacks::neo4j' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::neo4j') }
  end
end

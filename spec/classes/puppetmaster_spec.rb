require 'spec_helper'
describe 'stacks::puppetmaster' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::puppetmaster') }
  end
end

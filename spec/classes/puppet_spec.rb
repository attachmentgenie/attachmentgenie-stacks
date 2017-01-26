require 'spec_helper'
describe 'stacks::puppet' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::puppet') }
  end
end

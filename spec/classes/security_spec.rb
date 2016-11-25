require 'spec_helper'
describe 'stacks::security' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::security') }
  end
end

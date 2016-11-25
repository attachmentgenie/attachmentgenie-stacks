require 'spec_helper'
describe 'stacks::website' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::website') }
  end
end

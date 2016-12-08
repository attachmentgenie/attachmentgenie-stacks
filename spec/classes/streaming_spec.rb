require 'spec_helper'
describe 'stacks::streaming' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::streaming') }
  end
end

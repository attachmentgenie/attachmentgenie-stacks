require 'spec_helper'
describe 'stacks::prometheus' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::prometheus') }
  end
end

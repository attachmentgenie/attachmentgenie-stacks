require 'spec_helper'
describe 'stacks::testing' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::testing') }
  end
end

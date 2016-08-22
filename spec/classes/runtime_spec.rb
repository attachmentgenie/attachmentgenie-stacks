require 'spec_helper'
describe 'stacks::runtime' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::runtime') }
  end
end

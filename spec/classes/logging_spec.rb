require 'spec_helper'
describe 'stacks::logging' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::logging') }
  end
end

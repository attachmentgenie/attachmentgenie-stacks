require 'spec_helper'
describe 'stacks::bootstrap' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::bootstrap') }
  end
end

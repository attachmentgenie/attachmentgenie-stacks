require 'spec_helper'
describe 'stacks::database' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::database') }
  end
end

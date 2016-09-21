require 'spec_helper'
describe 'stacks::metrics' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::metrics') }
  end
end

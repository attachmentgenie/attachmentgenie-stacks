require 'spec_helper'
describe 'stacks::cache' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::cache') }
  end
end

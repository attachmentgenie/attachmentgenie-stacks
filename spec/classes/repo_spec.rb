require 'spec_helper'
describe 'stacks::repo' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::repo') }
  end
end

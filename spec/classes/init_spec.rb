require 'spec_helper'
describe 'stacks' do

  context 'with defaults for all parameters' do
    it { should contain_class('stacks') }
  end
end

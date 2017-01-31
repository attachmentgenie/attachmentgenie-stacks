require 'spec_helper'
describe 'stacks::mq' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::mq') }
  end
end

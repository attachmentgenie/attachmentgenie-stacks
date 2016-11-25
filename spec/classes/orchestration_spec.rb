require 'spec_helper'
describe 'stacks::orchestration' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::orchestration') }
  end
end

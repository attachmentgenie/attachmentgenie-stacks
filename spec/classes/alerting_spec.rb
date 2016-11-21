require 'spec_helper'
describe 'stacks::alerting' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::alerting') }
  end
end

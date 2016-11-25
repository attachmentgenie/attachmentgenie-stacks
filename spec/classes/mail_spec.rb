require 'spec_helper'
describe 'stacks::mail' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::mail') }
  end
end

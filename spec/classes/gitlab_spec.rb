require 'spec_helper'
describe 'stacks::gitlab' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::gitlab') }
  end
end

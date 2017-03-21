require 'spec_helper'
describe 'stacks::tools' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::tools') }
  end
end

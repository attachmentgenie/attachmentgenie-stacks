require 'spec_helper'
describe 'stacks::kafka' do
  context 'with defaults for all parameters' do
    it { should contain_class('stacks::kafka') }
  end
end

require 'spec_helper'
describe 'stacks::proxy' do

  context 'with defaults for all parameters' do
  let(:facts) { {:osfamily => 'Debian'} }
    it { should contain_class('stacks::proxy') }
  end
end

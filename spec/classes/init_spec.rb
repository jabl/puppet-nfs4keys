require 'spec_helper'
describe 'nfs4keys' do

  context 'with defaults for all parameters' do
    it { should contain_class('nfs4keys') }
  end
end

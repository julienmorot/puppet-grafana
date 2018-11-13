require 'spec_helper'
describe 'grafanagalera' do
  context 'with default values for all parameters' do
    it { should contain_class('grafanagalera') }
  end
end

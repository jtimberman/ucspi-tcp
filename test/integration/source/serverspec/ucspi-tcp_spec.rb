require 'spec_helper'

describe 'ucspi-tcp::default' do
  context file('/usr/local/bin/tcpserver') do
    it { should be_file }
    it { should be_executable }
  end
end

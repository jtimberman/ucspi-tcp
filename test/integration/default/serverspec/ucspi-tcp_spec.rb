require 'spec_helper'

case os[:family]
when 'gentoo'
  install_package = 'sys-apps/ucspi-tcp'
else
  install_package = 'ucspi-tcp'
end

describe 'ucspi-tcp::package' do
  context package(install_package) do  
    it { should be_installed }
  end
end

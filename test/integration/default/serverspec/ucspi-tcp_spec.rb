require 'spec_helper'

install_package = case os[:family]
                  when 'gentoo'
                    'sys-apps/ucspi-tcp'
                  else
                    'ucspi-tcp'
                  end

describe 'ucspi-tcp::package' do
  context package(install_package) do
    it { should be_installed }
  end
end

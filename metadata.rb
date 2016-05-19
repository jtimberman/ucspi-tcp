name             'ucspi-tcp'
maintainer       'Joshua Timberman'
maintainer_email 'cookbooks@housepub.org'
license          'Apache 2.0'
description      'Installs ucspi-tcp'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.3.0'

recipe 'ucspi-tcp', 'Installs ucspi-tcp based on "install_method" attribute'
recipe 'ucspi-tcp::aur', 'Installs ucspi-tcp via AUR (Arch User Repository)'
recipe 'ucspi-tcp::package', 'Installs ucspi-tcp via distribution-provided package'
recipe 'ucspi-tcp::source', 'Installs ucspi-tcp via compiled source'

%w( build-essential pacman ).each do |cb|
  depends cb
end

%w( ubuntu debian centos redhat arch ).each do |os|
  supports os
end

source_url 'https://github.com/jtimberman/ucspi-tcp' if respond_to?(:source_url)
issues_url 'https://github.com/jtimberman/ucspi-tcp/issues' if respond_to?(:issues_url)

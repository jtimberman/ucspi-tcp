name             'ucspi-tcp'
maintainer       'Joshua Timberman'
maintainer_email 'cookbooks@housepub.org'
license          'Apache 2.0'
description      'Installs ucspi-tcp'
version          '1.2.0'

recipe 'ucspi-tcp', 'Installs ucspi-tcp based on "install_method" attribute'
recipe 'ucspi-tcp::aur', 'Installs ucspi-tcp via AUR (Arch User Repository)'
recipe 'ucspi-tcp::package', 'Installs ucspi-tcp via distribution-provided package'
recipe 'ucspi-tcp::source', 'Installs ucspi-tcp via compiled source'

%w( build-essential pacman ).each do |cb|
  depends cb
end

%w( ubuntu debian centos rhel arch ).each do |os|
  supports os
end

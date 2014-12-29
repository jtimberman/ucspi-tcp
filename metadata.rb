name             'ucspi-tcp'
maintainer       'Joshua Timberman'
maintainer_email 'cookbooks@housepub.org'
license          'Apache 2.0'
description      'Installs ucspi-tcp'
version          '1.1.1'

recipe 'ucspi-tcp', 'Installs ucspi-tcp'

%w{ build-essential pacman }.each do |cb|
  depends cb
end

%w{ ubuntu debian centos rhel arch }.each do |os|
  supports os
end

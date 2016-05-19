#
# Cookbook Name:: ucspi-tcp
# Attribute:: default
#
# Copyright 2010, Opscode, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['ucspi']['install_method'] = 'package'
default['ucspi']['bin_dir'] = '/usr/bin'

# We don't have a reasonable way to test Ubuntu < 9.04, or Debian <
# 5.0 at this point in time, and this is a best effort to maintain
# compatibility for those platforms
if platform?('ubuntu') && node['platform_version'].to_f < 9.04
  default['ucspi']['install_method'] = 'source'
end

if platform?('debian') && node['platform_version'].to_f < 5.0
  default['ucspi']['install_method'] = 'source'
end

default['ucspi']['install_method'] = 'source' if platform_family?('rhel')
default['ucspi']['install_method'] = 'aur' if platform_family?('arch')

# We don't support relocatable source installation, and `/usr/local`
# is the default PREFIX.
if node['ucspi']['install_method'] == 'source'
  default['ucspi']['bin_dir'] = '/usr/local/bin'
end

default['ucspi']['source_url'] = 'http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz'

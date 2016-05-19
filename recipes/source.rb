#
# Cookbook:: ucspi-tcp
# Recipe:: source
#
# Author:: Joshua Timberman <joshua@chef.io>
# Copyright:: Copyright (c) 2014-2016, Chef Software, Inc. <legal@chef.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'

ucspi_file_name = node['ucspi']['source_url'].split('/').last
remote_file ::File.join(Chef::Config[:file_cache_path], ucspi_file_name) do
  source node['ucspi']['source_url']
  notifies :run, 'bash[install_ucspi]', :immediately
  not_if { ::File.exist?("#{node['ucspi']['bin_dir']}/tcpserver") }
end

bash 'install_ucspi' do
  action :nothing
  user 'root'
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  rm -rf ucspi-tcp
  mkdir ucspi-tcp
  tar zxvf #{ucspi_file_name} -C ucspi-tcp --strip-components 1
  cd ucspi-tcp
  perl -pi -e 's/extern int errno;/\#include <errno.h>/' error.h
  make setup check
  EOH
end

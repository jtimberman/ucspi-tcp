require 'serverspec'

set :backend, :exec

# chkconfig is not on PATH by default. so set it
set :path, '/sbin:/usr/local/sbin:$PATH'

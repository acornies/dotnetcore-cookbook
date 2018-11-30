#
# Cookbook Name:: dotnetcore
# Recipe:: _platform
#
# Copyright (C) 2016 Andrew Cornies
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info "Platform is #{node['platform_family']}"

case node['platform_family']
when 'windows'
    include_recipe 'dotnetcore::_windows'
when 'debian'
    include_recipe 'dotnetcore::_ubuntu'
when 'rhel'
    include_recipe 'dotnetcore::_tar_install'
else
    fail 'This cookbook currently only supports Debian/Ubuntu, CentOS/Amazon/Oracle/RHEL, and Windows.'
end

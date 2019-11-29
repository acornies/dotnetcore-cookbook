#
# Cookbook Name:: dotnetcore
# Recipe:: _tar_install
#
# Copyright (C) 2016 Andrew Cornies
#
# All rights reserved - Do Not Redistribute
#
# Installs dotnetcore using the tar instructions intended for CentOS, Oracle Linux, and Amazon
# https://www.microsoft.com/net/core#centos

package 'libunwind'
package 'libicu'

directory '/opt/dotnet' do
  recursive true
end

if node['dotnetcore']['package']['version']
  creates_guard = "/opt/dotnet/shared/Microsoft.NETCore.App/#{node['dotnetcore']['package']['version']}"
  tar_extract node['dotnetcore']['package']['tar'] do
    target_dir '/opt/dotnet'
    creates creates_guard
  end
else
  tar_extract node['dotnetcore']['package']['tar'] do
    target_dir '/opt/dotnet'
  end
end

link '/usr/bin/dotnet' do
  to '/opt/dotnet/dotnet'
end

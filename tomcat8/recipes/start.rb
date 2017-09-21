#
# Cookbook:: .
# Recipe:: start
#
# Copyright:: 2017, The Authors, All Rights Reserved.
template '/opt/tomcat/conf/tomcat-users.xml' do
  source 'tomcat-users.xml.erb'
  owner 'root'
  action :create
end


execute 'restart' do
  command 'initctl restart tomcat'
  action :run
end


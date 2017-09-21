#
# Cookbook:: .
# Recipe:: upstartscript
#
# Copyright:: 2017, The Authors, All Rights Reserved.
cookbook_file '/etc/init/tomcat.conf' do
  source 'tomcat.conf'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


execute 'reload' do
    command 'initctl reload-configuration'
    action :run
    not_if ::File.exist('/etc/init/tomcat.conf')
  end
  
  execute 'start' do
    command 'initctl start tomcat'
    action :run
    only_if ::File.exist('/etc/init/tomcat.conf')
  end
  

file '/home/vagrant/test.started' do
  content 'content'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  only_if ::File.exist('/etc/init/tomcat.conf')
end



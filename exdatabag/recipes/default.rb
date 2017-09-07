#
# Cookbook Name:: first
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

data_bag_obj=data_bag_item('databagexercise','prepro')

yum_package 'httpd' do
	action :install
 #package_name data_bag_obj['ui']['package_name']
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  variables ({  :http_port =>  data_bag_obj['ui']['port'] }) 
end

service 'httpd' do
  action [:enable, :start]
  subscribes :reload, 'template[/etc/httpd/conf/httpd.conf]', :immediately
end

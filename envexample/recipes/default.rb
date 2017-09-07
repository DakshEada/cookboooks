#
# Cookbook Name:: first
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'envexample::prodohai.rb'
product_environment=node['myfirstohaiplugin']['environment']
product_component=node['myfirstohaiplugin']['component']
data_bag_obj=data_bag_item('installhttp',product_environment)

package 'install httpd' do
  package_name data_bag_obj[product_component]['package_name']
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  variables ( {  :http_port =>  data_bag_obj[product_component]['port'] }) 
end

service 'httpd' do
  action [:enable, :start]
  subscribes :reload, 'template[/etc/httpd/conf/httpd.conf]', :immediately
end

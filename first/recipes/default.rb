#
# Cookbook Name:: first
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

data_bag_obj=data_bag_item('3compproject','qa')
cookbook_file '/tmp/firstsample.txt' do
  source 'test.txt'
  owner 'ec2-user'
  group 'ec2-user'
  mode '0755'
  action :create
end

template '/tmp/templatefile' do
  source 'samp.erb'
  variables( :tempVar => node['hostname'] )
end

template '/tmp/secondfile' do
  source 'second.erb'
  variables( :cookbookvar => data_bag_obj['ui']['port'] )
end

file '/tmp/newfile' do
  content #{node['myvar']}
  mode '0755'
  owner 'ec2-user'
  group 'ec2-user'
end

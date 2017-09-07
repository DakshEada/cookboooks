#plugin_path=Ohai::Config[:plugin_path].first
plugin_path='/opt/chef/embedded/lib/ruby/gems/2.4.0/gems/ohai-13.2.0/lib/ohai'
ohai "reload" do
  plugin "myproduct_ohai_vars"
  action :nothing
end

template "#{plugin_path}/myproduct_ohai_vars.rb" do
  source 'myproduct_ohai_vars.erb'
  action :create
  notifies :reload, "ohai[reload]", :immediately
end


package 'install httpd' do

  package_name 'httpd'
end

service 'httpd' do
  action [:enable, :start]
end

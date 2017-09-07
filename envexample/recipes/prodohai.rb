plugin_path=Ohai::Config[:plugin_path].first
ohai "reload" do
  plugin "myfirstohaiplugin"
  action :nothing
end

template "#{plugin_path}/myfirstohaiplugin.erb" do
  source 'myfirstohaiplugin.erb'
  action :create
  notifies :reload, "ohai[reload]", :immediately
end

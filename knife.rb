xdg_data_dir = File.expand_path('~/.local/share/chef')

log_level       :info
log_location    STDOUT
node_name       "slbmeh"
client_key      "#{xdg_data_dir}/slbmeh.pem"
chef_server_url 'https://api.chef.io/organizations/sbuzonas'
cookbook_path   ["#{xdg_data_dir}/cookbooks"]

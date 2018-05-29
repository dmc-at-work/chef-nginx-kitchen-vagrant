#
# Cookbook:: custom-nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


# repo = node["custom-nginx"]["repository_sources"].fetch(node["custom-nginx"]["repository"])

# apt_repository "nginx" do
#   uri repo["uri"]
#   distribution repo["distribution"]
#   components repo["components"]
#   key repo["key"]
#   keyserver repo["keyserver"] if repo["keyserver"]
#   deb_src repo["deb_src"]
#   action :add
# end

# include_recipe 'custom-nginx::web'

# Equivalent to : sudo apt-get update
# Defines the update frequency for APT repositories
apt_update 'Update the apt cache daily' do
  # Determines how frequently (in seconds) APT repository updates are made.
  frequency 86_400
  
  # Update the Apt repository at the interval specified by the frequency property.
  action :periodic
end

# Equivalent to : sudo apt-get nginx-full
# Installs the package.
package 'nginx-full'

# Creates a file in /var/www/html/index.html with the content copied from templates/index.html.erb
# Declares the location in which a file is to be created, the source template that will be used to create the file, and the permissions needed on that file.
template '/var/www/html/index.html' do
  # The template file that will be used to create the file on the node
  source 'index.html.erb'
end

# Enable nginx service
# Manages the state of a service.
service 'nginx' do
  # A list of properties that controls how the chef-client is to attempt to manage a service
  supports status: true

  # Identifies the steps the chef-client will take to bring the node into the desired state
  # Enables a service at boot and then starts the service
  action [:enable, :start]
end
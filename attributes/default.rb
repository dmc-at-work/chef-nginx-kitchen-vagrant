default["custom-nginx"]["dir"]        = "/etc/nginx"
default["custom-nginx"]["log_dir"]    = "/var/log/nginx"
default["custom-nginx"]["version"]    = nil
default["custom-nginx"]["package_name"] = "nginx"
default["custom-nginx"]["repository"] = "official"
default["custom-nginx"]["repository_sources"] = {
  "official" => {
    "uri"          => "http://nginx.org/packages/#{node["platform"]}",
    "distribution" => node["lsb"]["codename"],
    "components"   => ["nginx"],
    "keyserver"    => nil,
    "key"          => "http://nginx.org/keys/nginx_signing.key",
    "deb_src"      => false
  },

  "ppa" => {
    "uri"          => "http://ppa.launchpad.net/nginx/stable/ubuntu",
    "distribution" => node["lsb"]["codename"],
    "components"   => ["main"],
    "keyserver"    => "keyserver.ubuntu.com",
    "key"          => "C300EE8C",
    "deb_src"      => true
  },

  "phusion" => {
    "uri"          => "https://oss-binaries.phusionpassenger.com/apt/passenger",
    "distribution" => node["lsb"]["codename"],
    "components"   => ["main"],
    "keyserver"    => "keyserver.ubuntu.com",
    "key"          => "561F9B9CAC40B2F7",
    "deb_src"      => true
  }
}
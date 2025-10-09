export proxy_server=10.0.7.55:7890
export https_proxy=http://${proxy_server} http_proxy=http://${proxy_server} all_proxy=socks5://${proxy_server}

sudo -E nixos-rebuild test --verbose

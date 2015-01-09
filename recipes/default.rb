#
# Cookbook Name:: incomplete-hosts
# Recipe:: default
#
# Copyright 2015, Thomas Claridge
#
# All rights reserved
#

query   = node['incomplete-hosts']['search_query']
servers = search :node, query

template '/etc/hosts' do
  source 'hosts.erb'
  owner  'root'
  group  'root'
  mode   0644
  variables :servers => servers
end

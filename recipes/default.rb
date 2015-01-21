#
# Cookbook Name:: incomplete-hosts
# Recipe:: default
#
# Copyright 2015, Thomas Claridge
#
# All rights reserved
#

query   = node['incomplete-hosts']['search_query']

servers = []

if query.kind_of? Array
  query.each do |q|
    search(:node, q) do |node|
      servers << node
    end
  end
else
  servers = search :node, query
end

template '/etc/hosts' do
  source 'hosts.erb'
  owner  'root'
  group  'root'
  mode   0644
  variables :servers => servers
end

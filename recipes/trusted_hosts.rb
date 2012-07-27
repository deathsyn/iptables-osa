#
# Cookbook Name:: iptables
# Recipe:: trusted_hosts
#
# Copyright 2012, Kevin Berry
#
# Use the trusted_hosts databag to help populate hosts that should be
# exempt from further filtering.

include_recipe "iptables-osa::default"

trusted_hosts = search(:trusted_hosts, "*:*")

iptables_rule "trusted_host" do
  variables({:trusted_hosts => trusted_hosts})
end

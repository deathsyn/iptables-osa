maintainer        "Kevin Berry"
maintainer_email  "kevin@opensourcealchemist.com"
license           "Apache 2.0"
description       "Sets up iptables to use a script to maintain rules"
version           "1.0.0"

recipe "iptables-osa", "Installs iptables and sets up .d style config directory of iptables rules"
%w{ redhat centos debian ubuntu}.each do |os|
  supports os
end

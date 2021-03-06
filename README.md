Description
===========

Sets up iptables to use a script to maintain firewall rules. This cookbook is a fork of the Opscode Cookbook iptables. It has been forked in order to better serve my needs and chain concepts.

Roadmap
-------

* Modify to match my host needs, and be able to dynamically build rules from data bags

Requirements
============

## Platform:

* Ubuntu/Debian
* RHEL/CentOS

Recipes
=======

default
-------

The default recipe will install iptables and provides a perl script
(installed in `/usr/sbin/rebuild-iptables`) to manage rebuilding
firewall rules from files dropped off in `/etc/iptables.d`.

Definitions
===========

iptables\_rule
--------------

The definition drops off a template in `/etc/iptables.d` after the
`name` parameter. The rule will get added to the local system firewall
through notifying the `rebuild-iptables` script. See __Examples__ below.

Usage
=====

Ensure that the system is set up to use the definition and rebuild
script with `recipe[iptables]`. Then create templates with the
firewall rules in the cookbook where the definition will be used. See
__Examples__.

Examples
--------

To enable port 80, e.g. in an `httpd` cookbook, create the following
template:

    # Port 80 for http
    -A local_services -p tcp -m tcp --dport 80 -j ACCEPT

This would go in the cookbook,
`httpd/templates/default/port_http.erb`. Then to use it in
`recipe[httpd]`:

    iptables_rule "http"

License and Author
==================

Author:: Adam Jacob <adam@opscode.com>
Author:: Joshua Timberman <joshua@opscode.com>
Author:: Kevin Berry <kevin@opensourcealchemist.com>

Copyright:: 2008-2011, Opscode, Inc
Copyright:: 2012, Kevin Berry

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

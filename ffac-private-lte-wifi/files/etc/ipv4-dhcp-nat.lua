#!/usr/bin/lua

local uci = require('simple-uci').cursor()

-- IPv4 für DHCP vergeben auf WAN-Interface
uci:set('network', 'wan', 'proto', 'static')
uci:set('network', 'wan', 'ipaddr', '192.168.222.1')
uci:set('network', 'wan', 'netmask', '255.255.255.0')
uci:commit('network')

-- Forwarding über das wwan-Interface erlauben 
uci:set('firewall', '@zone[1]', 'forward', 'ACCEPT')

-- DHCP in Firewall auf WAN erlauben
uci:add('firewall', 'rule')
uci:set('firewall', '@rule[-1]', 'name', 'Allow-DHCP-WAN')
uci:set('firewall', '@rule[-1]', 'src', 'wan')
uci:set('firewall', '@rule[-1]', 'proto', 'udp')
uci:set('firewall', '@rule[-1]', 'src_port', '67 68')
uci:set('firewall', '@rule[-1]', 'dest_port', '67 68')
uci:set('firewall', '@rule[-1]', 'target', 'ACCEPT')

-- DNS in Firewall auf WAN erlauben
uci:add('firewall', 'rule')
uci:set('firewall', '@rule[-1]', 'name', 'Allow-DNS-WAN')
uci:set('firewall', '@rule[-1]', 'src', 'wan')
uci:set('firewall', '@rule[-1]', 'proto', 'tcp udp')
uci:set('firewall', '@rule[-1]', 'dest_port', '53')
uci:set('firewall', '@rule[-1]', 'target', 'ACCEPT')

-- NAT von wan auf wwan einrichten
uci:add('firewall', 'forwarding')
uci:set('firewall', '@forwarding[-1]', 'src', 'wan')
uci:set('firewall', '@forwarding[-1]', 'dest', 'wwan')
uci:commit('firewall')

-- DHCP-Server einstellen für wan
uci:set('dhcp', 'wan', 'start', '100')
uci:set('dhcp', 'wan', 'limit', '150')
uci:set('dhcp', 'wan', 'leasetime', '12h')
uci:set('dhcp', 'wan', 'force', '1')
uci:set('dhcp', 'wan', 'dhcp_option', '6,9.9.9.9')
uci:commit('dhcp')
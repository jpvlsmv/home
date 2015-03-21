#!/bin/bash
# Splunk setup commands

SPLUNK=/opt/splunk/bin/splunk

$SPLUNK edit user admin -password 'admin' -role admin -auth admin:changeme

cat >> /opt/splunk/etc/system/local/server.conf <<EOF
[license]
active_group = Free
EOF

$SPLUNK install app /vagrant/sw/sos-splunk-on-splunk_32.tgz

$SPLUNK restart splunkd

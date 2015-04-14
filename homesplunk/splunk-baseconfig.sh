#!/bin/bash
# Splunk setup commands

SPLUNK=/opt/splunk/bin/splunk

$SPLUNK edit user admin -password 'admin' -role admin -auth admin:changeme

cat >> /opt/splunk/etc/system/local/server.conf <<EOF
[license]
active_group = Free
EOF

$SPLUNK restart splunkd

#!/bin/bash

rm -rf files ; mkdir files

ssh root@192.168.16.1 'tar cf - `opkg list-changed-conffiles`' | (cd files ; tar xvf -)

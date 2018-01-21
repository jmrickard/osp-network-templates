#!/bin/bash

openstack overcloud deploy --templates \
-e /home/stack/templates/puppet-ceph-external.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/templates/network-environment.yaml \
--compute-scale 1 \
--control-scale 1 \
--compute-flavor compute \
--control-flavor control \
--ntp-server 10.1.1.253

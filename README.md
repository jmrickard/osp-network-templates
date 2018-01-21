# osp-network-templates
OpenStack 10 - Network Isolation and environment templates

## Pre-requisites:
This project assumes that director is successfully deployed and introspection has been completed. 

## Repo Inventory:

**deploy.sh** - Shell script used to deploy overcloud.
```
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
```
### bond-vlans - Environment and templates for OpenStack network isolation using bonds and vlans.
>      /switch_configs
>                      - etherchannel_summary.txt - View of interfaces bound to portchannel.
>                      - portchannel.txt - Port Channel configuration on switch
>                      - switch_interfaces.txt - switchport configuration for trunked interfaces.
>                      - vlan_breakdown.txt - VLAN definition for network separation within OSP.
>      /nic-configs 
>                      - compute.yaml - Compute node template file. NIC3 is on the controlplane for provisioning. NIC1 and NIC2 are bonded and trunked for network isolation. 
>                      - controller.yaml - Control node template file. NIC3 is on the controlplane for provisioning. NIC1 and NIC2 are bonded and trunked for network isolation.

**network-environment.yaml** - Environment file used to define network/vlan for Overcloud deployment.


### single-nic-vlans - Environment and templates for OpenStack network isolation using a trunked interface with VLANs and an interface for provisioning.
      /switch_configs
                      - switch_interfaces.txt - switchport configuration for trunked interfaces.
                      - vlan_breakdown.txt - VLAN definition for network separation within OSP.

      /nic-configs
                      - compute.yaml - Compute node template file. NIC3 is on the controlplane for provisioning. NIC 1 is trunked and used for network isolation.
                      - control.yaml - Control node template file. NIC3 is on the controlplane for provisioning. NIC 1 is trunked and used for network isolation.

**network-environment.yaml** - Environment file used to define network/vlan for Overcloud deployment. BondingInterfaceOvsOptions variable is commented out.

### undercloud - Contains a complete undercloud.conf

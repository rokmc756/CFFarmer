bosh create-env bosh-deployment/bosh.yml \
    --state=state.json \
    --vars-store=creds.yml \
    -o bosh-deployment/vsphere/cpi.yml \
    -v director_name=bosh-1 \
    -v internal_cidr=192.168.0.0/24 \
    -v internal_gw=192.168.0.1 \
    -v internal_ip=192.168.0.181 \
    -v network_name="VM Network" \
    -v vcenter_dc=wDC01 \
    -v vcenter_ds=datastore3 \
    -v vcenter_ip=192.168.0.202 \
    -v vcenter_user=Administrator@vsphere.local \
    -v vcenter_password="Changeme34#$" \
    -v vcenter_templates=bosh-1-templates \
    -v vcenter_vms=bosh-1-vms \
    -v vcenter_disks=bosh-1-disks \
    -v vcenter_cluster=wClu01


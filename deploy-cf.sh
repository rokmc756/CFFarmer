
export BOSH_ENVIRONMENT="192.168.0.181"
export BOSH_CLIENT="admin"
export BOSH_CLIENT_SECRET=`bosh int ./bosh-1/creds.yml --path /admin_password`
# export BOSH_CA_CERT=<DIRECTOR_CA_CERT_TEXT>


echo "11111111111111111111111111111111"

# OK

#bosh -n -e bosh-1 update-cloud-config ./cf-deployment/iaas-support/vsphere/cloud-config.yml \
#--vars-store ./cf-deployment/iaas-support/vsphere/cloud-config-vars.yml

#-v az1_zone="z1" -v az2_zone="z2" -v az3_zone="z3" \
#-v az1_vswitch_id="001" -v az2_vswitch_id="002" -v az3_vswitch_id="003" \
#-v az1_vswitch_range="192.168.0.0/24"  -v az2_vswitch_range="192.168.1.0/24" -v az3_vswitch_range="192.168.2.0/24" \
#-v az1_vswitch_gateway="192.168.0.1" -v az2_vswitch_gateway="192.168.1.1" -v az3_vswitch_gateway="192.168.2.1" \
#-v security_group_id_1="secgrp001" -v security_group_id_2="secgrp002" -v security_group_id_3="secgrp003" \
# -v tcp_slb_id_array=[] -v http_slb_id_array=[]


bosh -n -e bosh-1 update-runtime-config bosh-1/bosh-deployment/runtime-configs/dns.yml --name dns

exit


# OK
export IAAS_INFO=vsphere-esxi
export OS_INFO=ubuntu-jammy
export STEMCELL_VERSION=$(bosh interpolate ./cf-deployment/cf-deployment.yml --path=/stemcells/alias=default/version)

# OK
# bosh -n upload-stemcell https://bosh.io/d/stemcells/bosh-${IAAS_INFO}-${OS_INFO}-go_agent?v=${STEMCELL_VERSION}

echo "222222222222222222222222222222222"

export SYSTEM_DOMAIN=jtest.weka.io
export CF_DOMAIN=jtest.weka.io

#bosh -n -e bosh-1 update-cloud-config ./cf-deployment/iaas-support/bosh-lite/cloud-config.yml
# bosh -n -e bosh-1 update-cloud-config ./bosh-1/bosh-deployment/warden/cloud-config.yml

bosh -n -e bosh-1 update-cloud-config ./cf-deployment/iaas-support/vsphere/cloud-config.yml \
--vars-store ./cf-deployment/iaas-support/vsphere/cloud-config-vars.yml


# -o ./cf-deployment/operations/bosh-lite.yml \
bosh -n -e bosh-1 -d cf deploy ./cf-deployment/cf-deployment.yml \
--vars-store ./cf-deployment/iaas-support/vsphere/cloud-config-vars.yml \
-v system_domain="$SYSTEM_DOMAIN" \
-v cf_admin_password=admin \
-v uaa_admin_client_secret="$BOSH_CLIENT_SECRET"


exit


# -o ./cf-deployment/iaas-support/bosh-lite/cloud-config.yml \
#-v cf_admin_password="$BOSH_CLIENT_SECRET" \
#-v uaa_admin_client_secret="$BOSH_CLIENT_SECRET"

#git clone https://github.com/cloudfoundry/cf-deployment.git
#cd cf-deployment
#bosh-cli -n -e vbox upload-stemcell https://bosh.io/d/stemcells/bosh-warden-boshlite-ubuntu-trusty-go_agent \
#bosh-cli -n -e vbox update-cloud-config iaas-support/bosh-lite/cloud-config.yml \
#bosh-cli -n -e vbox -d cf deploy  cf-deployment.yml \
# -o operations/bosh-lite.yml \
# --vars-store deployment-vars.yml \
# -v system_domain=bosh-lite.com \
# -v cf_admin_password=admin \
# -v uaa_admin_client_secret=admin-secret



#\
#-v z3_network_reserved_range=[192.168.2.221-192.168.2.220] \


# -o ./cf-deployment/iaas-support/vsphere/cloud-config-vars.yml \


# bosh -e {{ director_name }} update-cloud-config ./cf-deployment/iaas-support/alicloud/cloud-config.yml \
# -v az1_zone={{ az1_zone }} -v az2_zone={{ az2_zone }} -v az3_zone={{ az3_zone }} \
# -v az1_vswitch_id={{ az1_vswitch_id }} -v az2_vswitch_id={{ az2_vswitch_id }} -v az3_vswitch_id={{ az3_vswitch_id }} \
# -v az1_vswitch_range={{ az1_vswitch_range }}  -v az2_vswitch_range={{ az2_vswitch_range }} -v az3_vswitch_range={{ az3_vswitch_range }} \
# -v az1_vswitch_gateway={{ az1_vswitch_gateway }} -v az2_vswitch_gateway={{ az2_vswitch_gateway }} -v az3_vswitch_gateway={{ az3_vswitch_gateway }} \
# -v security_group_id_1={{ security_group_id_1 }} -v security_group_id_2={{ security_group_id_2 }} -v security_group_id_3={{ security_group_id_3 }} \
# -v tcp_slb_id_array=[{{ tcp_slb_id_array }}] -v http_slb_id_array=[{{ http_slb_id_array }}]
# \<\< EOF > update_config.sh



#  [ -o operations/CUSTOMIZATION1 ] \
#  [ -o operations/CUSTOMIZATION2 (etc.) ]


# echo bosh -e bosh-1 update-cloud-config ./cf-deployment/iaas-support/vsphere/cloud-config.yml
# -v http_slb_id_array=[{{ http_slb_id_array }}] \<\< EOF > update_config.sh

# echo y >> update_config.sh
# echo EOF >> update_config.sh
# chmod +x update_config.sh
# ./update_config.sh
# echo export CF_DOMAIN={{ system_domain }} >> /etc/profile
# /etc/profile


# bosh -e {{ director_name }} upload-stemcell http://bosh.oss-cn-hangzhou.aliyuncs.com/light-bosh-stemcell-{{ stemcell_version }}-alicloud-kvm-ubuntu-trusty-go_agent.tgz
# cf-deployment/iaas-support/alicloud/upload-releases.sh ./releases {{ director_name }}
# echo bosh -e {{ director_name }} -d cf deploy releases/cf-deployment-local.yml --vars-store cf-vars.yml -o cf-deployment/iaas-support/alicloud/stemcells.yml -v region={{ alicloud_region }} -v system_domain={{ system_domain }} \<\< EOF > deploy_cf.sh


# bosh -e {{ director_name }} upload-stemcell http://bosh-{{ alicloud_region }}.oss-{{ alicloud_region }}.aliyuncs.com/light-bosh-stemcell-{{ stemcell_version }}-alicloud-kvm-ubuntu-trusty-go_agent.tgz
# bosh -e {{ director_name }} upload-release https://bosh.io/d/github.com/cloudfoundry/cf-release?v={{ cf_release_version }}
# echo bosh -e {{ director_name }} -d cf deploy cf-deployment/cf-deployment.yml --vars-store cf-vars.yml -o cf-deployment/iaas-support/alicloud/stemcells.yml -v region={{ alicloud_region }} -v system_domain={{ system_domain }} \<\< EOF > deploy_cf.sh


# echo yes >> deploy_cf.sh
# echo EOF >> deploy_cf.sh


#'{{ cf_deploy_dir }}/deploy_cf.sh'

#./deploy_cf.sh



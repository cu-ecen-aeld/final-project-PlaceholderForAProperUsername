#!/bin/bash
# Utility functions for the build process

# Adds a configuration to the conf/local.conf file.
# This function checks if the configuration is already
# present in the conf/local.conf file and if not, adds it
# to the conf/local.conf file.
function add_configuration () {
	CONFLINE=$1
	
	cat conf/local.conf | grep "${CONFLINE}" > /dev/null
	local_conf_info=$?

	if [ $local_conf_info -ne 0 ];then
		echo "Append ${CONFLINE} in the local.conf file"
		echo $CONFLINE >> conf/local.conf
		
	else
		echo "${CONFLINE} already exists in the local.conf file"
	fi
}

# This functions checks if a layer is already present and if not,
# the new layer will be added.
function add_layer () {
	LAYER=$1

	bitbake-layers show-layers | grep "${LAYER}" > /dev/null
	layer_info=$?

	if [ $layer_info -ne 0 ];then
		echo "Adding ${LAYER} layer"
		bitbake-layers add-layer ../$LAYER
	else
		echo "${LAYER} layer already exists"
fi
}

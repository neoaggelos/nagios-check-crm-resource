#!/bin/bash

# Author:       Aggelos Kolaitis
# Description:  Nagios/Icinga to check if a crm resource is running
# Usage:        check-crm-resource.sh my_resource_name
# Requirements: Append the following on your sudoers file:
#     Defaults:nagios !requiretty
#     nagios  ALL=(ALL) NOPASSWD: /usr/sbin/crm_mon -f -r -1

resource_name="$1"

if [ "x${resource_name}" = "x" ]; then
	echo "No resource name";
	exit 3
fi

resource_status=`sudo crm_mon -f -r -1 | grep "\<${resource_name}\>"`
exitcode=0

if [ "x${resource_status}" = "x" ]; then
	echo "CRITICAL: Resource '${resource_name}' not configured!"
	exit 2
fi

if [ "x$(echo ${resource_status} | grep 'Started')" = "x" ]; then
	echo -n "CRITICAL: "
	exitcode=2
else
	echo -n "OK: "
fi

echo ${resource_status}
exit ${exitcode}


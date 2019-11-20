#!/bin/bash

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


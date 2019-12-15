# check-crm-resource

Nagios/Icinga plugin to check for pacemaker resource status

Usage:

```bash
$ ./check-crm-resource.sh res_nginx
OK: res_nginx (systemd:nginx): Started MACHINE

$ ./check-crm-resource.sh res_nginx
CRITICAL: res_nginx (systemd:nginx): Stopped (disabled)
```

~ Aggelos Kolaitis

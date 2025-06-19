Project Overview

This collaborative project is intended as a hands-on, enjoyable way for friends to deepen their knowledge of monitoring and automation.

Requirements

A Proxmox instance installed on a dedicated machine, with either:

Ubuntu cloud-init template

LXC container (prefer ubuntu)

VPN connectivity between participating environments (e.g., between Douglas and José’s networks)



# Be careful!
Note: This should only be done after the project has been initialized with:
```sh
make lxc-init
```
Note: Before restoring the backup, make sure to stop the frontend and server services.

```sh
psql -h <IP> -U postgres -d postgres -c "DROP DATABASE IF EXISTS <APP_DATABASE>;"
```
```sh
psql -h <IP> -U postgres -d postgres -c "CREATE DATABASE <APP_DATABASE> OWNER <APP_OWNER>;"
```
```sh
psql -h <IP> -U <APP_OWNER> -d <APP_DATABASE> -f /path/to/backup.sql
```
Additional tips:
Replace <IP>, <APP_DATABASE>, <APP_OWNER>, and /path/to/backup.sql with your actual values.
Stop your application frontend and server before restoring to avoid conflicts or corruption.


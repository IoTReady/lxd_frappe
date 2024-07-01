# Notes
- [Install incus](https://linuxcontainers.org/incus/docs/main/installing/)
- [Initialise incus](https://linuxcontainers.org/incus/docs/main/howto/initialize/)
    - `incus admin init`
    - This sets up all the defaults needed to run the images (without zfs)

# Images

## frappe-base
- Includes the pre-requisites listed [here](https://frappeframework.com/docs/user/en/installation)
- We also install a few other packages that are needed: crontab, python3-venv
- Does NOT include mariadb to allow use with externally hosted DB
- Does NOT set up frappe-bench to allow installation of a version of your choice.

```bash
incus profile create frappe-base
# To restore backup
incus profile edit frappe-base < frappe-base.yaml
```

## frappe
- Builds on frappe-base
- Sets up separate zfs disk for /home to allow easier backups
- Sets up a `frappe` user with passwordles sudo
- Sets up frappe version-15 (current stable)

```bash
incus profile create frappe
# To restore backup
incus profile edit frappe < frappe.yaml
```

## frappe-mariadb
- Builds on frappe
- Sets up separate zfs disk for /var/lib/mysql to allow easier backups for MariaDB
- Sets up mariadb server and client
- Does NOT set a password for MariaDB root user - set one manually with `mysql_secure_installation`

```bash
incus profile create frappe-mariadb
# To restore backup
incus profile edit frappe-mariadb < frappe-mariadb-nozfs.yaml
./launch_frappe-mariadb.sh
./attach_frappe-mariadb.sh
cloud-init status --long
# Set root password for mariadb:
# Ensure you answer No when prompted for Unix socket auth
mysql_secure_installation
```

## frappe-full
- Builds on frappe-mariadb
- Sets up [supervisor](https://frappeframework.com/docs/user/en/bench/guides/setup-production)
- Sets up nginx and [DNS multitenancy](https://frappeframework.com/docs/user/en/bench/guides/setup-multitenancy)
- Does NOT setup SSL via Let's Encrypt. 
    - You should use Caddy or Traefik on the host to set up SSL and reverse proxy requests to nginx inside the container.

```bash
incus profile create frappe-full
# To restore backup
incus profile edit frappe-full < frappe-full.yaml
./launch_frappe-full.sh
mysql_secure_installation
```

# References
1. https://github.com/lxc/incus/blob/main/doc/cloud-init.md#yaml-format-for-cloud-init-configuration
2. https://blog.simos.info/how-to-customize-incus-containers-with-cloud-init/
3. https://cloudinit.readthedocs.io/en/latest/reference/examples.html
4. https://frappeframework.com/docs/user/en/installation

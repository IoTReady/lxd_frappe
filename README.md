# frappe-base
```bash
incus profile create frappe-base
# To restore backup
incus profile edit frappe-base < frappe-base.yaml
```

# frappe
```bash
incus profile create frappe
# To restore backup
incus profile edit frappe < frappe.yaml
```

# frappe-mariadb
```bash
incus profile create frappe-mariadb
# To restore backup
incus profile edit frappe-mariadb < frappe-mariadb.yaml
./launch_frappe-mariadb.sh
mysql_secure_installation
```

# References
1. https://github.com/lxc/incus/blob/main/doc/cloud-init.md#yaml-format-for-cloud-init-configuration
2. https://blog.simos.info/how-to-customize-incus-containers-with-cloud-init/
3. https://cloudinit.readthedocs.io/en/latest/reference/examples.html

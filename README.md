# Steps
```bash
incus profile create frappe_base
# 1. paste in frappe_base.yaml as per [1]
# 2. add disk and network as per [2]
# devices:
#   eth0:
#     name: eth0
#     network: incusbr0
#     type: nic
#   root:
#     path: /
#     pool: default
#     type: disk
incus profile edit frappe_base
# backup profile
incus profile show frappe_base > frappe_base.profile
# To restore backup
incus profile edit frappe_base < frappe_base.profile
```

# References
1. https://github.com/lxc/incus/blob/main/doc/cloud-init.md#yaml-format-for-cloud-init-configuration
2. https://blog.simos.info/how-to-customize-incus-containers-with-cloud-init/
3. https://cloudinit.readthedocs.io/en/latest/reference/examples.html

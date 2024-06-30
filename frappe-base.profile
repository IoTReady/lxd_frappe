config:
  cloud-init.user-data: |
    #cloud-config
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2e9G0sYa1yBe/w83JHH1GwDWgBF6Rcal+Fe0G8Kn8UQbhRJ5ytmeylJdg9M0rKN6V4tYUCEkHJ/A6g6dgQvGvHwJb9cUP3b/AwvVNdpd0xRYBpa6feeemfB/erCwEZmOOP/nIofRCZE9+v61o1hNy6oJkS19KCS3vwHtsEL1kXtXv2ZUr2EYlQJB3L+P83lAWqIDw0SSKjE6pRr88eexAo1da/dasrHa38YgQesSiwkO1ep4/6UtC0WnsmfZUNjWiqG6wARlsXk6w+k2XrgSmGLABnrnNJf3gAS1ghPUzx8HxPi/WvMjzWC8kt8o57PvtI97c4fAnB5ZG6Nc49Jiy8uLlBjtXkcOMDtiVlhKLU+8o/rWlIzXGKTfuZWdhbsE+07wheuna2zmC5nZjQ33Qo/9TGNFhfGS31JwNKJ4Re8x0Mm4u2gBD44OtRTrDSx2PpmSNQ+t60F/IGxyAx5s8+gkORj86IkTUBmyoNQsYNBbXqenoSu6pEMs1sCcvRC0= tej@t440p
    apt:
      sources:
        yarn:
          source: "deb https://dl.yarnpkg.com/debian/ stable main"
          keyid: 23E7166788B63E1E

    # Update apt database on first boot (run 'apt-get update').
    # Note, if packages are given, or package_upgrade is true, then
    # update will be done independent of this setting.
    # Default: false
    package_update: true

    # Upgrade the instance on first boot
    # Default: false
    package_upgrade: true

    # Install additional packages on first boot
    # Default: none
    # if packages are specified, then package_update will be set to true
    # packages may be supplied as a single package name or as a list
    # with the format [<package>, <version>] wherein the specific
    # package version will be installed.
    packages:
     - git 
     - python3-dev
     - python3-pip
     - redis-server
     - nodejs
     - yarn
     - xvfb
     - libfontconfig
     - wkhtmltopdf
     - curl
     - systemd-cron
    runcmd:
      - [ pip3, install, frappe-bench, --break-system-packages ]

description: "Frappe Base"
devices: 
  eth0:
    name: eth0
    network: incusbr0
    type: nic
  root:
    path: /
    pool: default
    type: disk
name: frappe-base
used_by: []
project: default

# Ubuntu Server:
- [ ] Create bootable USB using Rufus
- [ ] Setup WiFi and ethernet in installer
- [ ] Use entire disk when installing
- [ ] `git config --global credential.helper store`
- [ ] Setup SSH key
    ```sh
    ssh-keygen -t ed25519
    ssh-copy-id -i KEY_NAME USER@HOST
    ```
- [ ] Change sudoedit to vim: 
    ```sh
    sudo update-alternatives --config editor
    ```
- [ ] Configure SSH config
    - `$ sudoedit /etc/ssh/sshd_config`
    ```sh
    Port SSH_PORT
    AllowUsers USER
    PermitRootLogin no
    PasswordAuthentication no 
    PermitEmptyPasswords no
    ```
- [ ] Configure ufw
    ```bash
    sudoedit /etc/default/ufw
    # IPV6=no
    sudo ufw reload

    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow SSH_PORT
    sudo ufw enable
    ```
- [ ] Restart
    ```
    sudo shutdown -r now
    ```
- [ ] Fix boot process hanging because it expects both wifi AND ethernet to be connected (https://askubuntu.com/a/1245672)
    ```bash
    sudo systemctl edit systemd-networkd-wait-online.service

    # Add:
    [Service]
    ExecStart=
    ExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any

    sudo systemctl daemon-reload
    sudo systemctl restart systemd-networkd-wait-online.service
    ```
- [ ] Fail2Ban
    - Not really needed since we disable password authentication?
- [ ] GeoIP block
    - TODO
- [ ] Install docker + compose
  - https://docs.docker.com/engine/install/ubuntu/
  - https://docs.docker.com/engine/install/linux-postinstall/
- [ ] Disable WiFi Power Management
    ```bash
    sudoedit /etc/systemd/system/wlan-always-on.service

    ###
    [Unit]
    Description=Disable power management for wlp58s0
    After=network.target

    [Service]
    ExecStart=/usr/sbin/iwconfig wlp58s0 power off
    Type=oneshot

    [Install]
    WantedBy=default.target
    ###

    sudo systemctl daemon-reload
    sudo systemctl enable --now wlan-always-on.service
    ```
- [ ] Disable PCIe ASPM
    - [ ]  BIOS Settings: Click on Advanced; Click on Power; Click on Secondary power settings; Uncheck PCIe ASPM Support;
- [ ] Install automatic updates & upgrades


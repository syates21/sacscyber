#!/usr/bin/env bash
echo "Adding update config to /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu/ xenial-security universe main" >> /etc/apt/sources.list

oldline='Update-Package-Lists "0"'
newline='Update-Package-Lists "1"'

echo 'Updating /etc/apt/apt.conf.d files to have Update-Package-Lists "1"'
# Replace the Update-Package-Lists "0" entry with Update-Package-Lists "1"
#sed "s/$oldline/$newline/" /etc/apt/apt.conf.d/10periodic
#sed "s/$oldline/$newline/" /etc/apt/apt.conf.d/20auto-upgrades


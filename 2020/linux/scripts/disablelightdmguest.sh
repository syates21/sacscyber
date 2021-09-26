#!/usr/bin/env bash
echo "Disabling guest user for lightdm"
echo "allow-guest=false" > /etc/lightdm/lightdm.conf.d/50disableguest

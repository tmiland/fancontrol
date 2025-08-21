#!/usr/bin/env bash

module=nct6687
# DEVNAME=hwmon4=nct6687
dev_nct6687=$(find /sys -type l -printf '%p -> %l\n' | grep $module | head -n 1| grep -oP "devices.*")
# Get current hwmon value for nct6687 kernel module
hwmon_nct6687=$(echo $dev_nct6687 | grep -o "hwmon[0-9]")
# Get current hwmon value in /etc/fancontrol
hwmon_fancontrol=$(grep -P "hwmon.*=nct6687" /etc/fancontrol | cut -d ' ' -f 2 | sed "s|=nct6687||g")

if ! [[ "$hwmon_nct6687" == "$hwmon_fancontrol" ]]; then
  echo "$hwmon_nct6687 is in not /etc/fancontrol"
  sed -i "s|$hwmon_fancontrol|$hwmon_nct6687|g" /etc/fancontrol 1>/dev/null 2>&1
  systemctl restart fancontrol
else
  echo "$hwmon_nct6687 is in /etc/fancontrol"
fi

# DEVNAME=hwmon2=amdgpu
dev_amd=$(find /sys/bus -type l -printf '%p -> %l\n' | grep amdgpu | grep -oP "devices.*")
# Get current hwmon value for amdgpu
hwmon_amd=$(find /sys/$dev_amd/hwmon/ -maxdepth 1 -mindepth 1 -type d | grep -o "hwmon[0-9]")
# Get current hwmon value for amdgpu in /etc/fancontrol
hwmon_fancontrol_amd=$(grep -P "hwmon.*=nct6687" /etc/fancontrol | cut -d ' ' -f 1 | sed "s|=amdgpu||g" | sed "s|DEVNAME=||g")

if ! [[ "$hwmon_amd" == "$hwmon_fancontrol_amd" ]]; then
  echo "$hwmon_amd is in not /etc/fancontrol"
  sed -i "s|$hwmon_fancontrol_amd|$hwmon_amd|g" /etc/fancontrol 1>/dev/null 2>&1
  systemctl restart fancontrol
else
  echo "$hwmon_amd is in /etc/fancontrol"
fi

exit 0

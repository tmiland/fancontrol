# fancontrol
 Simple script implementing a temperature dependent fan speed control

### Additions to the original script:
 - Set MIN value if no enable file
   - Simply set fanspeed to MIN value if no enable file to avoid NOISE
   - Default is MAX, which creates alot of noise on shutdown/reboot.
   - Default MIN value: 30 PWM

### To use this script:

Backup original script:
```bash
sudo mv /usr/sbin/fancontrol /usr/sbin/fancontrol.orig
```
Download this script:
```bash
sudo wget -O /usr/sbin/fancontrol https://github.com/tmiland/fancontrol/raw/main/fancontrol
```
Restart fancontrol:
```bash
systemctl restart fancontrol
```

### Restore original script:
Move custom script:
```bash
sudo mv /usr/sbin/fancontrol /usr/sbin/fancontrol.github.bak
```
Restore original script:
```bash
sudo mv /usr/sbin/fancontrol.orig /usr/sbin/fancontrol
```
Restart fancontrol:
```bash
systemctl restart fancontrol
```

## Original source
  [ lm-sensors/prog/pwm/fancontrol ](https://github.com/lm-sensors/lm-sensors/blob/42f240d2a457834bcbdf4dc8b57237f97b5f5854/prog/pwm/fancontrol)

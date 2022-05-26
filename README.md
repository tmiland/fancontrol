# fancontrol
 Simple script implementing a temperature dependent fan speed control

### Additions to the original script:
 - Set MIN value if no enable file
   - Simply set fanspeed to MIN value if no enable file to avoid NOISE
   - Default is MAX, which creates alot of noise on shutdown/reboot.

## Original source
  [ lm-sensors/prog/pwm/fancontrol ](https://github.com/lm-sensors/lm-sensors/blob/42f240d2a457834bcbdf4dc8b57237f97b5f5854/prog/pwm/fancontrol)

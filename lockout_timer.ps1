#
# For enabling a lockout time-out on Windows devices by configuring a monitor timeout in the current power policy.
# On Windows 10, this will automatically cause the session to lock, but this may need to be configured pre-Windows 7.
#
# Change the time <10> to reflect how many minutes before the monitor is locked.
# Uncomment the second line when used on laptops or devices with batteries installed.
#
# Author: Jeff Starke
#
# Usage: Copy and paste into Administrative PowerShell.

$time=10
powercfg /change monitor-timeout-ac $time
powercfg /change monitor-timeout-dc $time

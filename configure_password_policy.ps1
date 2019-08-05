#
# This script will automatically configure the Windows system's password policy based on Microsoft's documented best-practices.
# Unfortunately, there's no easy way to enforce complexity, so it will open the security policy panel and prompt to set this.
#
# Author: Jeff Starke
#

net accounts /forcelogoff:900   # Force log off {minutes:no}
net accounts /minpwage:0    # Minimum password age {days:0}
net accounts /maxpwage:30   # Max password age {days:unlimited}
net accounts /minpwlen:14    # Minimum password length {0-14, default 6}
net accounts /uniquepw:24   # Length of password history maintained {0-24}
net accounts /lockoutthreshold:10   # Lockout threshold
net accounts /lockoutwindow:15   # Lockout duration
secpol.msc
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show('Please navigate to Account Policies > Password Policy and enable "Password must meet complexity requirements".')

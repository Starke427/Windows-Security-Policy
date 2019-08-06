#
# This script will automatically configure a Windows system's advanced audit policy based on Microsoft's documented best-practices.
# Author: Jeff Starke
#

# System
auditpol /set /subcategory:"Security System Extension" /success:enable /failure:disable > $null
auditpol /set /subcategory:"System Integrity" /success:enable /failure:enable > $null
auditpol /set /subcategory:"IPsec Driver" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Other System Events" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Security State Change" /success:enable /failure:disable > $null

# Logon/Logoff
auditpol /set /subcategory:"Logon" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Logoff" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Account Lockout" /success:enable /failure:enable > $null
auditpol /set /subcategory:"IPsec Main Mode" /success:enable /failure:enable > $null
auditpol /set /subcategory:"IPsec Quick Mode" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Special Logon" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Network Policy Server" /success:enable /failure:disable > $null
auditpol /set /subcategory:"User / Device Claims" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Group Membership" /success:enable /failure:disable > $null

# Object Access
auditpol /set /subcategory:"File System" /success:disable /failure:enable > $null
auditpol /set /subcategory:"Registry" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Kernel Object" /success:disable /failure:disable > $null
auditpol /set /subcategory:"SAM" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Certification Services" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Application Generated" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Handle Manipulation" /success:disable /failure:disable > $null
auditpol /set /subcategory:"File Share" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Filtering Platform Packet Drop" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Other Object Access Events" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Detailed File Share" /success:disable /failure:enable > $null
auditpol /set /subcategory:"Removable Storage" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Central Policy Staging" /success:disable /failure:disable > $null

# Privilege Use
auditpol /set /subcategory:"Non Sensitive Privilege Use" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Other Privilege Use Events" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Sensitive Privilege Use" /success:enable /failure:disable > $null

# Detailed Tracking
auditpol /set /subcategory:"Process Creation" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Process Termination" /success:disable /failure:disable > $null
auditpol /set /subcategory:"DPAPI Activity" /success:disable /failure:disable > $null
auditpol /set /subcategory:"RPC Events" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Plug and Play Events" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Token Right Adjusted Events" /success:disable /failure:disable > $null

# Policy Change
auditpol /set /subcategory:"Audit Policy Change" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Authorization Policy Change" /success:enable /failure:disable > $null
auditpol /set /subcategory:"MPSSVC Rule-Level Policy Change" /success:enable /failure:enable > $null
auditpol /set /subcategory:"Filtering Platform Policy Change" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Other Policy Change Events" /success:disable /failure:enable > $null

# Account Management
auditpol /set /subcategory:"Computer Account Management" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Security Group Management" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Distribution Group Management" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Application Group Management" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Other Account Management Events" /success:enable /failure:disable > $null
auditpol /set /subcategory:"User Account Management" /success:enable /failure:enable > $null

# DS Access
auditpol /set /subcategory:"Directory Service Access" /success:disable /failure:enable > $null
auditpol /set /subcategory:"Directory Service Changes" /success:enable /failure:disable > $null
auditpol /set /subcategory:"Directory Service Replication" /success:disable /failure:disable > $null
auditpol /set /subcategory:"Detailed Directory Service Replication" /success:disable /failure:disable > $null

# Account Logon
auditpol /set /category:"Account Logon" /success:enable /failure:enable > $null

echo ""
echo "The local audit policy has been updated. Please review the new configuration below."
Start-Sleep 3
echo ""

auditpol /get /category:*

#
# This script will automatically configure a Windows system's advanced audit policy based on Microsoft's documented best-practices.
# Author: Jeff Starke
#
auditpol /get /category:"System"
auditpol /get /category:"Logon/Logoff"
auditpol /get /category:"Object Access"
auditpol /get /category:"Privilege Use"
auditpol /get /category:"Detailed Tracking"
auditpol /get /category:"Policy Change"
auditpol /get /category:"Account Management"
auditpol /get /category:"DS Access"
auditpol /get /category:"Account Logon"
echo ""
echo "Please copy and past the above output to the original ticket."

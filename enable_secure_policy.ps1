# Download from url and write to local file in $env:temp, which translates as the user's C:\Users\XXX\AppData\Local\Temp.
# When executed, will download and run the audit and password policy scripts.
# Automatically keeps up to date with latest versioning. Commenting out powershell.exe will allow you to edit scripts prior to execution.
#
# Author: Jeff Starke

$url1 = "https://raw.githubusercontent.com/Starke427/Windows-Security-Policy/master/configure_audit_policy.ps1"
$file1 = "$env:temp\configure_audit_policy.ps1"

$url2 = "https://raw.githubusercontent.com/Starke427/Windows-Security-Policy/master/configure_password_policy.ps1"
$file2 = "$env:temp\configure_password_policy.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
(New-Object -TypeName System.Net.WebClient).DownloadFile($url2, $file2)


powershell.exe -ExecutionPolicy ByPass -File $file1
powershell.exe -ExecutionPolicy ByPass -File $file2

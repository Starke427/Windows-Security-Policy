#
# Enable PowerShell Module and ScriptBlock Logging on Non-Enterprise Windows 10 Devices
# Author: Jeff Starke
#

# Create Registry Path and Enable Module Logging
New-Item –Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows" –Name PowerShell
New-Item –Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell" –Name ModuleLogging
Set-Itemproperty -path 'HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging' -Name 'EnableModuleLogging' -Value '1'
New-Item –Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging" –Name ModuleNames
Set-Itemproperty -path 'HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames' -Name '*' -Value '*'
Get-Item -path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging
Get-Item -path HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging/ModuleNames

#  Create Registry Path and Enable ScriptBlock Logging
New-Item –Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell" –Name ScriptBlockLogging
Set-Itemproperty -path 'HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' -Name 'EnableScriptBlockLogging' -Value '1'
Get-Item -path HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging

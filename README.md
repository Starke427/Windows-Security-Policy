# Windows-Security-Policy
Specific guidance and configuration scripts based on Microsoft-recommended security configuration baselines for Windows. Intended for all Windows environments, especially stand-alone (non-domain managed) systems that are typically overlooked.

---
This is intended to provide high-level guidance on configuring the Window’s Advanced Audit Policy Configuration based on recommendations from Microsoft to meet CIS standards. Full details on each category can be found at https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/advanced-security-audit-policy-settings.  

Due to the limitations of system access control lists (SACLs) it is recommended that you implement some form of agent-based monitoring of file systems and registries instead of relying on Global Object Access Auditing. This will also, generally, provide you with some form of more centralized audit logging which will help simplify the validation of logging during audit assessments. A great, free alternative would be to take advantage of Sysmon, which you can automate the deployment of [here](https://github.com/Starke427/Sysmon-Configs).

To aide in your assessment, you can take advantage of Microsoft's Security Compliance Toolkit (SCT). SCT is a set of tools that allows enterprise security administrators to download, analyze, test, edit, and store Microsoft-recommended security configuration baselines for Windows. Using the toolkit, administrators can compare their current GPOs with Microsoft-recommended GPO baselines or other baselines, edit them, store them in GPO backup file format, and apply them broadly through Active Directory or individually through local policy. The toolkit is available here:  https://docs.microsoft.com/en-us/windows/security/threat-protection/security-compliance-toolkit-10  

### Account Logon
Configuring policy settings in this category can help you document attempts to authenticate account data on a domain controller or on a local Security Accounts Manager (SAM). Unlike Logon and Logoff policy settings and events, which track attempts to access a particular computer, settings and events in this category focus on the account database that is used.

This category includes the following subcategories:

Audit Credential Validation – Success/Failure

Audit Kerberos Authentication Service – Success/Failure

Audit Kerberos Service Ticket Operations – Success/Failure

Audit Other Logon/Logoff Events – Success/Failure

### Account Management
The security audit policy settings in this category can be used to monitor changes to user and computer accounts and groups. 

This category includes the following subcategories:

Audit Application Group Management - Success

Audit Computer Account Management - Success

Audit Distribution Group Management - Success

Audit Other Account Management Events - Success

Audit Security Group Management - Success

Audit User Account Management – Success/Failure

### Detailed Tracking
Detailed Tracking security policy settings and audit events can be used to monitor the activities of individual applications and users on that computer, and to understand how a computer is being used. 

This category includes the following subcategories:

Audit DPAPI Activity – Not Configured

Audit PNP activity - Success

Audit Process Creation - Success

Audit Process Termination – Not Configured

Audit RPC Events - Success

Audit Credential Validation – Failure

Audit Token Right Adjusted – Not Configured

### DS Access
DS Access security audit policy settings provide a detailed audit trail of attempts to access and modify objects in Active Directory Domain Services (AD DS). These audit events are logged only on domain controllers. 

This category includes the following subcategories:

Audit Detailed Directory Service Replication – Not Configured

Audit Directory Service Access - Failure

Audit Directory Service Changes - Success

Audit Directory Service Replication – Not Configured

### Logon/Logoff
Logon/Logoff security policy settings and audit events allow you to track attempts to log on to a computer interactively or over a network. These events are particularly useful for tracking user activity and identifying potential attacks on network resources. 

This category includes the following subcategories:

Audit Account Lockout - Failure

Audit User/Device Claims - Success

Audit Group Membership – Success

Audit IPsec Extended Mode – Not Configured

Audit IPsec Main Mode – Not Configured

Audit IPsec Quick Mode – Not Configured

Audit Logoff – Not Configured

Audit Logon – Success/Failure

Audit Network Policy Server - Success

Audit Other Logon/Logoff Events – Success/Failure

Audit Special Logon – Success

### Object Access
Object Access policy settings and audit events allow you to track attempts to access specific objects or types of objects on a network or computer. To audit attempts to access a file, directory, registry key, or any other object, you must enable the appropriate Object Access auditing subcategory for success and/or failure events. For example, the file system subcategory needs to be enabled to audit file operations, and the Registry subcategory needs to be enabled to audit registry accesses.

Proving that these audit policies are in effect to an external auditor is more difficult. There is no easy way to verify that the proper SACLs are set on all inherited objects. To address this issue, see Global Object Access Auditing.

This category includes the following subcategories:

Audit Application Generated – Not Configured

Audit Certification Services – Success/Failure

Audit Detailed File Share - Failure

Audit File Share – Success/Failure

Audit File System - Failure

Audit Filtering Platform Connection - Failure

Audit Filtering Platform Packet Drop – Not Configured

Audit Handle Manipulation – Not Configured

Audit Kernel Object – Not Configured

Audit Other Object Access Events – Success/Failure

Audit Registry – Not Configured

Audit Removable Storage – Success/Failure

Audit SAM – Not Configured

Audit Central Access Policy Staging – Not Configured

### Policy Change
Policy Change audit events allow you to track changes to important security policies on a local system or network. Because policies are typically established by administrators to help secure network resources, monitoring changes or attempts to change these policies can be an important aspect of security management for a network. 

This category includes the following subcategories:

Audit Audit Policy Change - Success

Audit Authentication Policy Change - Success

Audit Authorization Policy Change - Success

Audit Filtering Platform Policy Change – Not Configured

Audit MPSSVC Rule-Level Policy Change – Success/Failure

Audit Other Policy Change Events – Failure

### Privilege Use
Permissions on a network are granted for users or computers to complete defined tasks. Privilege Use security policy settings and audit events allow you to track the use of certain permissions on one or more systems. 

This category includes the following subcategories:

Audit Non-Sensitive Privilege Use – Not Configured

Audit Other Privilege Use Events – Not Configured

Audit Sensitive Privilege Use – Success  # Failure auditing is recommended per MSFT, but is very noisey and not included by default

### System
System security policy settings and audit events allow you to track system-level changes to a computer that are not included in other categories and that have potential security implications. 

This category includes the following subcategories:

Audit IPsec Driver – Not Configured

Audit Other System Events – Success/Failure

Audit Security State Change - Success

Audit Security System Extension – Not Configured

Audit System Integrity – Success/Failure

### Global Object Access Auditing
Global Object Access Auditing policy settings allow administrators to define computer system access control lists (SACLs) per object type for the file system or for the registry. The specified SACL is then automatically applied to every object of that type. Auditors will be able to prove that every resource in the system is protected by an audit policy by viewing the contents of the Global Object Access Auditing policy settings. For example, if auditors see a policy setting called "Track all changes made by group administrators," they know that this policy is in effect.

Resource SACLs are also useful for diagnostic scenarios. For example, setting the Global Object Access Auditing policy to log all the activity for a specific user and enabling the policy to track "Access denied" events for the file system or registry can help administrators quickly identify which object in a system is denying a user access.

Note:  If a file or folder SACL and a Global Object Access Auditing policy setting (or a single registry setting SACL and a Global Object Access Auditing policy setting) are configured on a computer, the effective SACL is derived from combining the file or folder SACL and the Global Object Access Auditing policy. This means that an audit event is generated if an activity matches the file or folder SACL or the Global Object Access Auditing policy.

This category includes the following subcategories:

File System (Global Object Access Auditing) – Not Configured

Registry (Global Object Access Auditing) – Not Configured

# Enable Advanced Auditing and Password Policy

This will automatically configure your local audit and password policies per MSFT security baselines. Please see the sections below if you would prefer to only configure one or the other. This will be implemented immediately on the local system.

The script finishes by opening the local security policy and prompting you to enable password complexity, as there is currently no way to script-out enabling this feature. Under Security Settings > Account Policies > Password Policy, click on and enable 'Password must meet complexity requirements.'

```
$url1 = "https://raw.githubusercontent.com/Starke427/Windows-Security-Policy/master/enable_secure_policy.ps1"
$file1 = "$env:temp\enable_secure_policy.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Set-ExecutionPolicy -ExecutionPolicy Bypass -force
& "$env:temp\enable_secure_policy.ps1"
```

# Configure Advanced Auditing

To simplify audit policy configuration for stand-alone systems, the following will automatically configure all policies as mentioned above. The following must be run from an Administrative PowerShell.

```
$url1 = "https://raw.githubusercontent.com/Starke427/Windows-Security-Policy/master/configure_audit_policy.ps1"
$file1 = "$env:temp\configure_audit_policy.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Set-ExecutionPolicy -ExecutionPolicy Bypass -force
& "$env:temp\configure_audit_policy.ps1"
```

# Configure Password Policy

To simplify password policy configuration for stand-alone systems, this script will automatically configure the following:  

Force Log Off:  900 Minutes  
Minimum Password Age:   0 days  
Maximum Password Age:   30 days  
Minimum Password Length:  14 characters  
Number of Passwords Remembered: 24  
Account Lockout Threshold:   10  
Account Lockout Duration:   15 minutes  

The script finishes by opening the local security policy and prompting you to enable password complexity, as there is currently no way to script-out enabling this feature. Under Security Settings > Account Policies > Password Policy, click on and enable 'Password must meet complexity requirements.'

```
$url1 = "https://raw.githubusercontent.com/Starke427/Windows-Security-Policy/master/configure_password_policy.ps1"
$file1 = "$env:temp\configure_password_policy.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Set-ExecutionPolicy -ExecutionPolicy Bypass -force
& "$env:temp\configure_password_policy.ps1"
```

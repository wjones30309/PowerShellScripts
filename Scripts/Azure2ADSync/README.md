# Synchronize Office 365 users back to Active Directory

Here is procedure how you can move your authentication to on-premise Active Directory. It works in scenario when you already have Office 365 services without Azure AD Connect synchronization. It also allows using Pass-through authentication so your credentials are not even stored in Microsoft Azure.

1. Get a report of Office 365 users using <a href="../../Get-O365Users">Get-O365Users</a>

2. Install Azure AD Connect and configure synchronization. Options are up to you, it can be Password Sync, Pass-through authentication etc.

3. Import Office 365 Users using <a href="../../Get-O365Users">Import-O365Users</a>

4. Ask users to change their Active Directory passwords.

In more complex scenarios Azure Self-Service Password Reset and Password Writeback features can be used to achieve more smoother transition. Some day users will be asked to change their password via Office 365 portal. They will not ever notice that their identities were migrated to on-premise AD.
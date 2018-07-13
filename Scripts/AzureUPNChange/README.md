# Microsoft Azure AD Connect - Change UPN

How to change User Principal Name attribute for synchronized user?

```powershell
Set-MsolUserPrincipalName -UserPrincipalName "name@example.com" -NewUserPrincipalName "newname@example.com"
```

**Note:** “User Account Administrator” role is enough to perform this action.

Alternatively, you can enable UPN synchronization via **SynchronizeUpnForManagedUsers** feature:

```powershell
Set-MsolDirSyncFeature -Feature SynchronizeUpnForManagedUsers -Enable $True
```

After activating this feature, when you change UPN on premises it will sync all the changes to the Office 365.
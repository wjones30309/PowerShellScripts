# Active Directory - Password Reset Delegation Audit using PowerShell

I have Test OU within example.com Active Directory. PWResetUser was delegated password reset permissions on that OU. However, delegated user can’t reset passwords for all accounts inside specified unit due to access denied errors. The PowerShell script below helps to identify the problematic user accounts.

```powershell
./Check-ADAcl.ps1 -Identity "*PWResetUser" -OU "OU=Test,DC=example,DC=com"
```

```cmd
Rights         User         Type Identity
------         ----         ---- --------
Reset Password Username1   Allow TEST\PWResetUser
Reset Password Username2   Allow TEST\PWResetUser
No Data        Username3 No Data No Data
```

As you can see Username3 has No Data. After checking security tab of user properties, I found the problem. It was due to disabled security inheritance on that user.

![screen1](screen1.png)

So after reenabling the inheritance (or manually delegating password reset permission for PWResetUser), delegated user can reset password for Username3 as well. The report now looks better.

```cmd
Rights         User       Type Identity
------         ----       ---- --------
Reset Password Username1 Allow TEST\PWResetUser
Reset Password Username2 Allow TEST\PWResetUser
Reset Password Username3 Allow TEST\PWResetUser
```

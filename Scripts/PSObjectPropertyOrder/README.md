# PowerShell - PSObject property order (ordered hash tables)

How to change property order during PSObject output?

```powershell
$Properties = @{
 a = 1
 b = 2
 c = 3
}
$Object = New-Object -TypeName PSObject -Property $Properties
```

```text
$Object
c b a
- - -
3 2 1
```

What if you need a,b and then c property order?

```powershell
$Properties = @{
 a = 1
 b = 2
 c = 3
}
$Object = New-Object -TypeName PSObject -Property $Properties
```

```text
$Object | select a,b,c
a b c
- - -
1 2 3
```

Or even simpler, just add `[Ordered]` before `@{`  
**Note:** I am not sure but it seems to be working since .Net 4.0 or something like that.

```powershell
$Properties = [Ordered]@{
 a = 1
 b = 2
 c = 3
}
$Object = New-Object -TypeName PSObject -Property $Properties
```

```text
$Object
a b c
- - -
1 2 3
```
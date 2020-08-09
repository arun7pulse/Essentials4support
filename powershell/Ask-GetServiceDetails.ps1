
param(
[string[]]$ServiceName="BITS"
)
Foreach($i in $Servicename ){Get-Service -ComputerName localhost | Where-Object {$_.name -eq $i} |
ForEach-Object { 
    write-host -ForegroundColor 6 "ServiceName :: $($_.name) "
    write-host -ForegroundColor 6 "ServiceStatus :: $($_.Status)"  
    if($_.DependentServices)  { write-host -ForegroundColor 11 "`tServices that depend on $($_.name) "  
      foreach($s in $_.DependentServices){ "`t`t" + $s.name +"::" + $s.Status } 
    } #end if DependentServices 
    if($_.RequiredServices) { Write-host -ForegroundColor 10 "`tServices required by $($_.name)" 
      foreach($r in $_.RequiredServices){ "`t`t" + $r.name +"::" + $s.Status } 
    } #end if DependentServices 
} 
}

param(
[string[]]$ComputerName = @('localhost'),
$Limit=20
)
Write-Host $Limit
Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3"  -Computername $ComputerName |
Sort-Object -Property SystemName,DeviceID |
Format-Table -AutoSize -Property SystemName,
                                 DeviceID,
                                @{n='Size(GB)';e={$_.Size / 1GB};formatstring='N2'},
                                @{n='FreeSpace(GB)';e={$_.FreeSpace / 1GB};formatstring='N2'},
                                @{n='UsedSpace(GB)';e={($_.Size - $_.FreeSpace) / 1GB};formatstring='N2'},
                                @{n='PercentUsed';e={(($_.Size - $_.FreeSpace)/$_.Size)*100};formatstring='N2'},
                                @{n='Threshhold(20%)';e={if(($_.Size * ($Limit / 100 )) -gt $_.FreeSpace){'Breached'} };formatstring='N2'} | Out-File -Force -FilePath ./SMSDiskInfo.txt


./SMSDiskInfo.txt

                                


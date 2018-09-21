<#
.DESCRIPTION 
        Retrives disk info 
.SYNOPSIS 
        Get disk space
.PARAMETER computername 
        Specifies ta single computer name or Ip Address 
.EXAMPLE 
Get-DiskInfo -ComputernName localhost

#>

# Author - ArunSk.

PARAM(
[string[]]$ComputerName='localhost'
)

foreach($C in $computerName){

Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" -Computername $C |
Sort-Object -Property DeviceID |
Format-Table -AutoSize -Property @{n='ComputerName';e={$C}},
                                 DeviceID,
                                @{n='Size(GB)';e={$_.Size / 1GB};formatstring='N2'},
                                @{n='FreeSpace(GB)';e={$_.FreeSpace / 1GB};formatstring='N2'},
                                @{n='UsedSpace(GB)';e={($_.Size - $_.FreeSpace) / 1GB};formatstring='N2'},
                                @{n='PercentUsed';e={(($_.Size - $_.FreeSpace)/$_.Size)*100};formatstring='N2'},
                                @{n='Threshhold(30%)';e={if(($_.Size * 0.70) -gt $_.FreeSpace){'Breached'} };formatstring='N2'}
                                

}
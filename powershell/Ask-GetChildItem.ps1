# Author - ArunSK. 

Param (
    [string]$Path = "$pwd",
    [string]$Extention = "*"
    )

Get-ChildItem -Path $Path -Recurse | Select-Object Length,Directory,Name,LastAccessTime, LastWriteTime, Extension | Where-Object {$_.Extension -like "$Extention" } | sort Length -desc | Format-Table -AutoSize
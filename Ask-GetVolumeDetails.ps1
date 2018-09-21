# Author - ArunSK. 

Get-Volume | Select-Object DriveLetter,Size,SizeRemaining,DriveType,HealthStatus | Where DriveType -eq "fixed" | Format-Table -AutoSize

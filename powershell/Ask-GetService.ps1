# Author - ArunSK. 


Get-Service | Select-Object Name,Status,DisplayName | sort Status | FORMAT-TABLE -AUTOSIZE

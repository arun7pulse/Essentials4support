#REM Author - ArunSanthoshKumar. 

param(
[string[]]$ComputerName = @("localhost"),
[string[]]$ServiceName = @('notepad','mspaint')
)

Get-Service -Name $ServiceName -ComputerName $ComputerName | Select -Property MachineName,Name,Status,DisplayName | Sort MachineName,Name | Format-Table -AutoSize | Out-File -Force ./SMSServicDetails.txt

./SMSServicDetails.txt

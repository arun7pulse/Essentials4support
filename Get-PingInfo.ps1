param(
[string[]]$ComputerName = @('localhost')
)

Test-Connection $ComputerName -count 1 |Format-Table -AutoSize | Out-File -Force ./PingDetails.txt

./PingDetails.txt

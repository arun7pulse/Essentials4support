Clear-Host

Add-PSSnapin -name Quest.ActiveRoles.ADManagement

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

$user = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the User Logon ID to Disable", "User ID", "")

$chkuser = Get-QADUser -LogonName $user
if ($chkuser) {
   Add-Type -AssemblyName System.Web
   
   $AD = Get-QADUser -identity $user
   $Name = $AD.DisplayName
   
   $BoxMsg = "Disable the user account for " + $Name + "?"
   
   $Answer = [System.Windows.Forms.MessageBox]::Show($BoxMsg , "Disable User" , 4, 64)
   
   if ($Answer -EQ "Yes") {
      $OU = $AD.canonicalName
      $OU = $OU.Replace($Name, "")
      $OU = $OU + "Deactivated"

      Disable-QADUser $user | Out-Null
   
      Move-QADObject $user -to $OU | Out-Null
   
      $wshell = New-Object -ComObject Wscript.Shell
      
      $wshell.Popup("User account $user has been disabled",0,"Account Disabled",0x1) | Out-Null
   
   }
   
   if ($Answer -EQ "No") {
      $wshell = New-Object -ComObject Wscript.Shell

      $wshell.Popup("The user account was not Disabled",0,"Account Not Disabled",0x1) | Out-Null
   }
}   

if (-Not $chkuser) {
   $wshell = New-Object -ComObject Wscript.Shell

   $wshell.Popup("The user $user was not found",0,"Not Found",0x1) | Out-Null
}

Remove-PSSnapin -name Quest.ActiveRoles.ADManagement

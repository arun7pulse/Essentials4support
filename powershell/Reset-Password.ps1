Clear-Host

Add-PSSnapin -name Quest.ActiveRoles.ADManagement

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null

[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

$Issue = [Microsoft.VisualBasic.Interaction]::InputBox("Enter IssueTrak Case Number", "IssueTrak Number", "")

$user = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the User Logon ID to Reset", "User ID", "")

$chkuser = Get-QADUser -LogonName $user
if ($chkuser) {
   Add-Type -AssemblyName System.Web
   
   $AD = Get-QADUser -identity $user
   $Name = $AD.DisplayName
   
   $BoxMsg = "Reset the password for " + $Name + "?"
   
   $Answer = [System.Windows.Forms.MessageBox]::Show($BoxMsg , "Reset Password" , 4, 64)
   
   if ($Answer -EQ "Yes") {
      $PW = [Web.Security.Membership]::GeneratePassword(8,1)

      $AD = Get-QADUser -identity $user
      $Name = $AD.DisplayName

      Set-QADUser $user -UserPassword $PW | Out-Null
      Set-QADUser -identity $user -UserMustChangePassword $true | Out-Null

      $wshell = New-Object -ComObject Wscript.Shell

      $wshell.Popup("The Password for $Name has been reset",0,"Password Reset",0x1) | Out-Null
      
      $OU = $AD.canonicalName
      $OU = $OU.Replace($Name, "")
      
      $WriteName = "Name:" +"`t" + "`t" + $Name + "`r`n"
      $WriteID = "Logon ID:" + "`t" + $user + "`r`n"
      $WritePW = "Password:" + "`t" + $PW + "`r`n"

      $Body = $WriteName + $WriteID + $WritePW
      $smtpServer = "prd-smtp.prd.hosted"
      $msgFrom = "PasswordReset@accero.com"
      if ($OU -Match "Shared") {
         write-host $AD.Email
         $recipients = $AD.Email
      }
            else {
               #$recipients = "sec_officer@asktech.com"
               $recipients = "Arun7pulse@gmail.com"
      }
      $subj = "Issue $Issue"
   
      Send-MailMessage -from $msgFrom -To $recipients -Subject $subj -body $Body -smtpServer $smtpServer
      
      $wshell.Popup("eMail sent with the new credentials",0,"eMail Sent",0x1) | Out-Null
   }
      
if ($Answer -EQ "No") {
      $wshell = New-Object -ComObject Wscript.Shell

      $wshell.Popup("The Password was not reset",0,"Password Not Reset",0x1) | Out-Null
   }
}
      else {
         $wshell = New-Object -ComObject Wscript.Shell

         $wshell.Popup("The user $user was not found",0,"Not Found",0x1) | Out-Null
      }

Remove-PSSnapin -name Quest.ActiveRoles.ADManagement

# Author - ArunSK.
$ShortcutFile = "$env:Public\Desktop\LockScreen.lnk" 
    $WScriptShell = New-Object -ComObject WScript.Shell 
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile) 
    $Shortcut.TargetPath = "$Env:WinDir\system32\rundll32.exe" 
    $Shortcut.Arguments = "user32.dll,LockWorkStation" 
    $Shortcut.IconLocation = "$Env:WinDir\system32\SHELL32.dll,47" 
    $Shortcut.Save() 
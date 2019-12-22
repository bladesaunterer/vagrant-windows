# Boxstarter setup script
 
# Notes:
#  - This file has to be idempotent. it will be run several times if the
#    computer needs to be restarted. When that happens, Boxstarter schedules
#    this script to run again with an auto-logon. Fortunately choco install
#    handles trying to install the same package more than once.
#  - Pass -y to choco install to avoid interactive prompts
 
# Install Rhapsody IDE
& cmd.exe /c C:\vagrant\RhapsodyIDE6.4.2.exe /S

# Fix Windows Explorer
Set-WindowsExplorerOptions -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
 
# Useful apps
choco install -y googlechrome
choco install -y firefox
choco install -y 7zip
choco install -y notepadplusplus
choco install git -y -params '"/GitAndUnixToolsOnPath /NoAutoCrlf"'
choco install -y sql-server-management-studio

Remove-Item 'C:\Users\Public\Desktop\Boxstarter Shell.lnk'

$Desktop = [Environment]::GetFolderPath("Desktop")

$WScriptShell = New-Object -ComObject WScript.Shell

$Shortcut = $WScriptShell.CreateShortcut("${Desktop}\Notepad++.lnk")
$Shortcut.TargetPath = "${env:ProgramFiles}\Notepad++\notepad++.exe"
$Shortcut.Save()

$Shortcut = $WScriptShell.CreateShortcut("${Desktop}\Rhapsody.lnk")
$Shortcut.TargetPath = "${env:ProgramFiles(x86)}\Orion Health\Rhapsody IDE 6\Rhapsody IDE\RhapAdmin6.exe"
$Shortcut.Save()

$Shortcut = $WScriptShell.CreateShortcut("${Desktop}\SQL Server Management Studio 18.lnk")
$Shortcut.TargetPath = "${env:ProgramFiles(x86)}\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe"
$Shortcut.Save()

$Shortcut = $WScriptShell.CreateShortcut("${Desktop}\Git Bash.lnk")
$Shortcut.TargetPath = "${env:ProgramFiles}\Git\git-bash.exe"
$Shortcut.Arguments = "--cd-to-home"
$Shortcut.Save()

exit
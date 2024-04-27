# Scan and Fix File System Errors (2x sfc /scannow & Dism)
sfc /scannow
Repair-WindowsImage -Online -RestoreHealth
# sfc /scannow again, thats normal
sfc /scannow
Write-Host "Press any key to close the optimization, closing the window will result in an error." -NoNewline -ForegroundColor Red
$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') > $null 2>&1
exit

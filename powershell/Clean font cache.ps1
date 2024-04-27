# Clean Font Cache
net stop FontCache > $null 2>&1
net stop FontCache3.0.0.0 > $null 2>&1
Remove-Item -Path "$env:SYSTEMROOT\ServiceProfiles\LocalService\AppData\Local\FontCache\*.dat" -Force -Recurse -Confirm:$false -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SYSTEMROOT\SysNative\FNTCACHE.DAT" -Force -Recurse -Confirm:$false -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SYSTEMROOT\System32\FNTCACHE.DAT" -Force -Recurse -Confirm:$false -ErrorAction SilentlyContinue
net start FontCache > $null 2>&1
net start FontCache3.0.0.0 > $null 2>&1
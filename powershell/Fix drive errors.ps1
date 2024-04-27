function Check-Fix-Drives {
    # Get all drives except C:
    $drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Name -ne "C" }
    # Repair non-C: drives
    cls
     foreach ($drive in $drives) {
        $driveLetter = $drive.Name + ":"
        cls
        Write-Host "Checking and repairing $driveLetter" -ForegroundColor Red
        Write-Host "You may receive a prompt to unmount the drive, make sure you are not using the drive before accepting, it won't be usable until its finished" -ForegroundColor Red
        & chkdsk $driveLetter /f /r
    }
    cls
    Write-Host "Scheduling check and repair for C: on next reboot, please press Y to Agree" -ForegroundColor Red
    chkdsk C: /f /r
    cls
    Write-Host "Do you want to restart and check/repair C: now? (Y/N)" -NoNewline -ForegroundColor Red
    $response = Read-Host
    if ($response -eq "Yes") {
        cls
        Write-Host "Restarting the computer for repairs" -ForegroundColor Red
        shutdown /r /t 0
    } else {
        exit
    }
}
cls 
Check-Fix-Drives

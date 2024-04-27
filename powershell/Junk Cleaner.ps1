# Hone Cleaner
function Cleaner {
	Write-Host ("Starting DISM Component Cleanup... (This could take a long time)") -ForegroundColor Yellow
	DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
	cls
	$paths = @(
		"$env:LOCALAPPDATA\Microsoft\Windows\INetCache\IE\*",
		"$env:SYSTEMROOT\Downloaded Program Files\*",
		"$env:TEMP\*",
		"$env:SYSTEMROOT\SoftwareDistribution\download\*",
		"$env:SYSTEMROOT\Temp\*",
		"$env:SYSTEMROOT\Prefetch\*",
		"$env:SYSTEMROOT\Minidump\*",
		"$env:AllUsersProfile\temp\*",
		"$env:AllUsersProfile\Microsoft\Windows\WER\ReportArchive\*",
		"$env:AllUsersProfile\Microsoft\Windows\WER\ReportQueue\*",
		"$env:AllUsersProfile\Microsoft\Windows\WER\Temp\*",
		"$env:LOCALAPPDATA\Microsoft\Windows\Temporary Internet Files\*",
		"$env:LOCALAPPDATA\Microsoft\Windows\WebCache\*",
		"$env:LOCALAPPDATA\Microsoft\Windows\AppCache\*",
		"$env:SYSTEMROOT\system32\catroot2\*",
		"$env:LOCALAPPDATA\D3DSCache\*",
		"$env:SYSTEMROOT\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\*",
		"$env:SYSTEMROOT\LiveKernelReports\*",
		"$env:SystemRoot\SysNative\Winevt\Logs\*",
		"$env:SystemRoot\System32\Winevt\Logs\*",
		"$env:LOCALAPPDATA\PCHealth\ErrorRep\QSignoff\*",
		"$env:SYSTEMROOT\pchealth\ERRORREP",
		"$env:SYSTEMROOT\pchealth\helpctr\DataColl\*.xml",
		"$env:SYSTEMROOT\pchealth\helpctr\OfflineCache",
		"$env:SYSTEMROOT\System32\config\systemprofile\AppData\Local\CrashDumps\*.dmp",
		"$env:SYSTEMROOT\System32\config\systemprofile\Local Settings\Application Data\CrashDumps\*.dmp",
		"$env:SYSTEMROOT\SysWOW64\config\systemprofile\AppData\Local\CrashDumps\*.dmp",
		"$env:SYSTEMROOT\SysWOW64\config\systemprofile\Local Settings\Application Data\CrashDumps\*.dmp",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Network Inspection System\Support\*.log",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Scans\History\CacheManager",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Scans\History\ReportLatency\Latency",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Scans\History\Service\*.log",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Scans\MetaStore",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Support",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Scans\History\Results\Quick",
		"$env:AllUsersProfile\Microsoft\Windows Defender\Scans\History\Results\Resource",
		"$env:SYSTEMROOT\Logs\CBS\*",
		"$env:SYSTEMROOT\Logs\DISM\*",
		"$env:SYSTEMROOT\Logs\DPX\*",
		"$env:SYSTEMROOT\Logs\MeasuredBoot\*",
		"$env:SYSTEMROOT\Logs\NetSetup\*",
		"$env:SYSTEMROOT\Logs\RecEnv_Ramdisk\*",
		"$env:SYSTEMROOT\Logs\SystemRestore\*",
		"$env:SYSTEMROOT\Logs\WindowsBackup\*",
		"$env:AllUsersProfile\USOShared\Logs\System\*",
		"$env:AllUsersProfile\USOShared\Logs\User\*",
		"$env:SYSTEMROOT\ServiceProfiles\LocalService\AppData\Local\Temp\*"
	)
	
	$totalSizeMB = 0
	
	foreach ($path in $paths) {
		Get-ChildItem -Path $path -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
			$sizeMB = [math]::Round($_.Length / 1MB, 2)
			$file = $_.FullName
	
			try {
				Remove-Item $file -Force -Recurse -Confirm:$false -ErrorAction Stop
				$totalSizeMB += $sizeMB
				Write-Host ("Successfully deleted: {0} (Size: {1} MB)" -f $file, $sizeMB) -ForegroundColor DarkGreen
			} catch {
				Write-Warning ("Could not delete file because it is used: {0}" -f $file)
			}
		}
	}
	
	Write-Host ("Total size of successfully deleted files: {0} MB" -f $totalSizeMB) -ForegroundColor Green
	Write-Host "Press any key to close the optimization, closing the window will result in an error." -NoNewline -ForegroundColor Red
	$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') > $null 2>&1
	exit
}
cls
Cleaner

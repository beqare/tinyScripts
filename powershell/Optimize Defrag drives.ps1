function Optimize-Drives {
	$drives = Get-PSDrive -PSProvider FileSystem
	foreach ($drive in $drives) {
		$driveLetter = $drive.Name
		Write-Host "Optimizing drive $driveLetter" -ForegroundColor Red
		Optimize-Volume -DriveLetter $driveLetter -Verbose -Erroraction SilentlyContinue
	}
	Write-Host "Press any key to close the optimization, closing the window will result in an error." -NoNewline -ForegroundColor Red
	$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown') > $null 2>&1
	exit
}
cls
Optimize-Drives

function Get-SteamPath {
    try {
        $steampath = Get-ItemPropertyValue "Registry::HKCU\Software\Valve\Steam" -Name "SteamPath" -ErrorAction SilentlyContinue
        if ($steampath -and (Test-Path $steampath)) {
            return $steampath
        }

        $defaultPropertyValue = Get-ItemPropertyValue "Registry::HKCR\steam\Shell\Open\Command" -Name "(Default)" -ErrorAction SilentlyContinue
        if ($defaultPropertyValue) {
            $steampath = Split-Path ((($defaultPropertyValue -Split "--", 2, "SimpleMatch")[0]).Trim('"'))
            if ($steampath -and (Test-Path $steampath)) {
                return $steampath
            }
        }

        $folderCache = "Registry::HKCR\Local Settings\Software\Microsoft\Windows\Shell\MuiCache"
        $propertyValue = (Get-Item $folderCache).Property | Where-Object { $_ -Like "*Steam*" } | ForEach-Object {
            $value = Get-ItemPropertyValue $folderCache -Name $_
            if ($value -eq "Steam") {
                return Split-Path ($_.TrimEnd(".FriendlyAppName"))
            }
        }

        return $null
    } catch {
        Write-Error "Error while getting Steam path: $_"
        return $null
    }
}

$Steampathfolder = Get-SteamPath

# Hone Steam Cleaner
# The Hone Steam Cleaner aims at deleting cache, log and garbage from your Steam installation
function HoneSteamCleaner {
	$paths = @(
	"$env:USERPROFILE\AppData\Local\CrashDumps\*",
	"$env:USERPROFILE\Steam\httpcache\*",
	"$env:USERPROFILE\Steam\librarycache\*",
	"$env:USERPROFILE\Steam\stats\*",
	"$Steampathfolder\dumps\*",
	"$Steampathfolder\bin\cef\cef.win7x64\debug.log",
	"$Steampathfolder\depotcache\*",
	"$Steampathfolder\appcache\*",
	"$Steampathfolder\steamapps\shadercache\*",
	"$Steampathfolder\steamapps\temp\*"
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
HoneSteamCleaner
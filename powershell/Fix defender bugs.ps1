# Fix Windows Defender Detection Bugs
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\MetaConfig.mof" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.edb" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Windows Kits\10\Windows Performance Toolkit\wpa.exe" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.xml" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Datastore.edb" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:LOCALAPPDATA"\Temp\NVIDIA Corporation\NV_Cache" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath ${env:ProgramFiles(x86)}"\Steam\" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCStatusHistory.mof" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:PROGRAMDATA"\NVIDIA Corporation\NV_Cache" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.log" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\WindowsPowerShell\v1.0\Modules" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Windows Kits\10\Windows Performance Toolkit\WPRUI.exe" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Common Files\Steam\SteamService.exe" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:userprofile"\NTUser.dat" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Tmp.edb" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.cmtx" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCResourceStateCache.mof" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\winevt\Logs\*.evtx" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\EventLog\Data\lastalive?.dat" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.sdb" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.dat" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.chk" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Edb.chk" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\*.log" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\ConfigurationStatus" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCEngineCache.mof" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.csv" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.chk" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\GroupPolicy\Machine\Registry.tmp" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\GroupPolicy\Machine\Registry.pol" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.log" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\apppatch\sysmain.sdb" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Edb*.jrs" -ErrorAction SilentlyContinue
Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.jrs" -ErrorAction SilentlyContinue

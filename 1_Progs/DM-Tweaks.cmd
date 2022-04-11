Color 1F
@echo off
mode con cols=180 lines=40
title 				*** SCHEDULED TASKS SERVICES tweaks ***
cls
@echo.
@echo.
@echo. *** SERVICES tweaks - basically to disable tracking and info gathering ***
REM The Windows Search service is set to demand (Manual), since it's needed when using the start menu search.
sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
sc config RemoteRegistry start= disabled
sc config TrkWks start= disabled
sc config WMPNetworkSvc start= disabled
sc config WSearch start= disabled
rem sc config wscsvc start= disabled
rem sc config WSearch start= demand
@echo.
@echo.
@echo.  *** SCHEDULED TASKS tweaks ***
timeout /t 5 > nul
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" /Disable
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" /Disable
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" /Disable
schtasks /Change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" /Disable
timeout /t 2 > nul
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
timeout /t 2 > nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable
timeout /t 2 > nul
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskCleanup\SilentCleanup" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
timeout /t 2 > nul
schtasks /Change /TN "Microsoft\Windows\File Classification Infrastructure\Property Definition Sync" /Disable
schtasks /Change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Multimedia\SystemSoundsService" /Disable
schtasks /Change /TN "Microsoft\Windows\Media Center\mcupdate_scheduled" /Disable
schtasks /Change /TN "Microsoft\Windows\NetCfg\BindingWorkItemQueueHandler" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\Ras\MobilityManager" /Disable
schtasks /Change /TN "Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /Disable
schtasks /Change /TN "Microsoft\Windows\RetailDemo\CleanupOfflineContent" /Disable
schtasks /Change /TN "Microsoft\Windows\SettingSync\BackgroundUploadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\SettingSync\NetworkStateChangeTask" /Disable
timeout /t 2 > nul
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /Disable
timeout /t 2 > nul
schtasks /Change /TN "Microsoft\Windows\Offline Files\Background Synchronization" /Disable
schtasks /Change /TN "Microsoft\Windows\Offline Files\Logon Synchronization" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\IndexerAutomaticMaintenance" /Disable
timeout /t 2 > nul
schtasks /Change /TN "Microsoft\Windows\SpacePort\SpaceAgentTask" /Disable
schtasks /Change /TN "Microsoft\Windows\User Profile Service\HiveUploadTask" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\WCM\WiFiTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Workplace Join\Automatic-Device-Join" /Disable
timeout /t 2 > nul
rem schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /Disable
rem schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /Disable
rem schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /Disable
rem schtasks /Change /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /Disable
@echo.  	*** Remove Telemetry & Data Collection ***
timeout /t 2 > nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
@echo.
@echo.
@echo.  	*** Few more ***Settings -> Privacy -> General -> Let apps use my advertising ID
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
REM - SmartScreen Filter for Store Apps: Disable
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
REM - Let websites provide locally...
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
@echo  	*** Few more... *** WiFi Sense: HotSpot Sharing: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v value /t REG_DWORD /d 0 /f
@REM WiFi Sense: Shared HotSpot Auto-Connect: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v value /t REG_DWORD /d 0 /f
timeout /t 2 > nul
@REM Change Windows Updates to "Notify to schedule restart"
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t REG_DWORD /d 1 /f
@REM Disable P2P Update downlods outside of local network
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f
@rem "***Disabling delivery optimization...***"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /t REG_DWORD /v DODownloadMode /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /t REG_DWORD /v SystemSettingsDownloadMode /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f
@echo.
@echo.
@echo.   "***Setting Windows 10 privacy options...***"  <=============================TESTING 2017 new
timeout /t 5 > nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /t REG_DWORD /v Enabled /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /t REG_DWORD /v EnableWebContentEvaluation /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /t REG_SZ /v Value /d DENY /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /t REG_DWORD /v AcceptedPrivacyPolicy /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /t REG_DWORD /v Enabled /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /t REG_DWORD /v RestrictImplicitTextCollection /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /t REG_DWORD /v RestrictImplicitInkCollection /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /t REG_DWORD /v HarvestContacts /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /t REG_DWORD /v Enabled /d 0  /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /t REG_DWORD /v NumberOfSIUFInPeriod /d 0 /f
reg add "HKCU\Control Panel\International\User Profile" /t REG_DWORD /v HttpAcceptLanguageOptOut /d 1 /f

@echo.
@echo.
echo ^<ESC^>[34m [34m *** Disable Cortana & Telemetry *** "***Disabling Cortana and Bing search...***[0m
timeout /t 3 > nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
REM *** Hide the search box from taskbar. You can still search by pressing the Win key and start typing what you're looking for ***
REM 0 = hide completely, 1 = show only icon, 2 = show long search box
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 1 /f
Rem  Disable  Bing Search in Start Menu
Rem Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f

@echo.
@echo.
REM *** Disable MRU lists (jump lists) of XAML apps in Start Menu ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f

REM *** Set Windows Explorer to start on This PC instead of Quick Access ***
REM 1 = This PC, 2 = Quick access
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

REM *** Show file extensions in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t  REG_DWORD /d 0 /f
@echo.
@echo.
@echo.  	*** Few more... ***
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
schtasks /Change /TN "Adobe Flash Player Updater" /Disable
schtasks /delete /tn "\Adobe Flash Player Updater" /f
rem schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
rem schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
REM schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable REM *** Not sure if should be disabled, maybe related to S.M.A.R.T.
REM schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable


@echo.  	*** Few more...Office ***
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable

@echo.
@echo.
; moved to new user cmd
;echo ^<ESC^>[93m [93m*** Uninstall OneDrive ***   *** Uninstall OneDrive ***   *** Uninstall OneDrive ***[0m
;start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
;"%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
;rd C:\OneDriveTemp /Q /S >NUL 2>&1
;rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
;rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
;rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
;reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
;reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
@echo.  	*** OneDrive has been removed. Windows Explorer needs to be restarted.
timeout /t 8 > nul
@echo.
@echo.
@echo.  *** Microsoft Teams autostart
timeout /t 5 > nul

@echo.
@echo.
@echo.	*** Skype Update KILL ***
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Skype\Phone" /v "DisableVersionCheck" /t REG_DWORD /d 0 /f
rem "DisableVersionCheck"=dword:00000001

@echo.
@echo.
@echo. 	***Stopping and disabling diagnostics tracking services, Onedrive sync service, various Xbox services, Distributed Link Tracking, and Windows Media Player network sharing (you can turn this back on if you share your media libraries with WMP)...***"
timeout /t 3 > nul
get-service Diagtrack,DmwApPushService,OneSyncSvc,XblAuthManager,XblGameSave,XboxNetApiSvc,TrkWks,WMPNetworkSvc | stop-service -passthru | set-service -startuptype disabled
timeout /t 5 > nul



@echo.
@echo.
@echo.  	*** ******* Decrapification complete.*******" ***
timeout /t 5 > nul
exit
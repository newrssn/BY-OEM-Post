color 06
@echo off
mode con cols=80 lines=45
title 					POWER CONFIG 2017
cls
@echo.
@echo            *** PowerConfig tweaks ***

powercfg /L
rem powercfg  /query
rem C:\WINDOWS\system32>powercfg /L
powercfg -lastwake
rem or powercfg -devicequery wake_armed
;powercfg /h off
@echo.  hibernate timeout  0 Done.
@echo.-----------------------------------
timeout /t 2 > nul

rem Existing Power Schemes (* Active)
rem -----------------------------------
rem Power Scheme GUID: 1da4abb2-0808-40a8-99dc-0044cec64234  (My Custom Plan 1) *
rem Power Scheme GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (Balanced)
rem Power Scheme GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High performance)
rem Power Scheme GUID: 9800006f-8c62-40c0-806c-71e3349f154e  (Recommended Settings)
rem Power Scheme GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (Power saver)
rem powercfg -setdcvalueindex GUID 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 Index
rem powercfg -setacvalueindex GUID 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 Index
rem Index	Action
rem 0	Do nothing
rem 1	Sleep
rem 2	Hibernate
rem 3	Shut down

rem powercfg -SetActive 381b4222-f694-41f0-9685-ff5bb260df2e

rem =========================================================================================

powercfg -change -monitor-timeout-ac 30
powercfg -change -monitor-timeout-dc 5
powercfg -change -disk-timeout-ac 30
powercfg -change -disk-timeout-dc 15
powercfg -change -standby-timeout-ac 60
powercfg -change -standby-timeout-dc 20
powercfg -change -hibernate-timeout-ac 0
powercfg -change -hibernate-timeout-dc 0
;powercfg /h off

@echo.  SLEEP timeouts  Done.
@echo.-----------------------------------
timeout /t 3 > nul

rem =========================================================================================
rem HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Controls Folder\PowerCfg

rem HKEY_CURRENT_USER\Control Panel\PowerCfg

rem 0 - Home/Office desktop 
rem 1 - Portable/Laptop computer 
rem 2 - Monitor on for presentations 
rem 3 - Network computer (no Wake-on-LAN) 
rem 4 - Optimized for high performance 
rem 5 - Optimized for power saving

rem Index Power setting type For use on
rem 0 Power Saver AC
rem 1 Power Saver DC
rem 2 Balanced AC
rem 3 Balanced DC
rem 4 High Performance AC
rem 5 High Performance DC
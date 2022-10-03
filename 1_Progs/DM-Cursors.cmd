color 02
@echo off
mode con cols=80 lines=45
title 					Cursor Install @ DM 2022
cls
rem
@echo.
@echo 	* HUD-Evolution-Turquoise-EZEvolution Install
InfDefaultInstall.exe "%SystemRoot%\Cursors\HUD-Evolution-Turquoise-EZEvolution\install.inf"
InfDefaultInstall.exe "%SystemRoot%\Cursors\MAC\install.inf"
@echo  Done.

exit

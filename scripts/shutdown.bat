::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpaSBaHKyuUAYlS7+T69e/KtUAhR+EtcZ/PyYidKPUH7krze6YOmH9Cnas=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
:BEGIN
SET "FEDORA_GUID={7074c68d-dbf7-11f0-8b5f-806e6f6e6963}"
ECHO.
ECHO.
ECHO ^|------------------------Powering Off----------------------------^|
ECHO ^|   ^>Press 1 to shutdown the computer.                          ^|
ECHO ^|   ^>Press 2 to restart the computer.                           ^|
ECHO ^|   ^>Press 3 to restart the computer and boot into linux.       ^|
ECHO ^|   ^>Press 4 to shutdown the computer and boot to linux next.   ^|
ECHO ^|   ^>Press Q to quit.                                           ^|
ECHO ^|----------------------------------------------------------------^|
ECHO.
CHOICE /N /C 1234"q" /M ">Input: "%1
IF ERRORLEVEL ==5 GOTO QUIT
IF ERRORLEVEL ==4 GOTO SHUTDOWN_LINUX
IF ERRORLEVEL ==3 GOTO REBOOT_LINUX
IF ERRORLEVEL ==2 GOTO RESTART
IF ERRORLEVEL ==1 GOTO SHUTDOWN

GOTO QUIT
:SHUTDOWN
shutdown.exe /f /p
GOTO QUIT
:RESTART
shutdown.exe /r
:REBOOT_LINUX
REM sudo bcdedit /bootsequence "{7074c68e-dbf7-11f0-8b5f-806e6f6e6963}" /addfirst
sudo bcdedit /set {fwbootmgr} bootsequence %FEDORA_GUID%
shutdown.exe /r /t 0
GOTO QUIT
:SHUTDOWN_LINUX
REM sudo bcdedit /bootsequence "{7074c68e-dbf7-11f0-8b5f-806e6f6e6963}" /addfirst
sudo bcdedit /set {fwbootmgr} bootsequence %FEDORA_GUID%
shutdown.exe /f /p
GOTO QUIT
:QUIT
exit

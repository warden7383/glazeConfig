::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdFy5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdFy5
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
::Zh4grVQjdCyDJGyX8VAjFDpaSBaHKyuUAYlS7+T69e/KtUAhR+oqbIvUzbqxNOUA/iU=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
:BEGIN
ECHO.
ECHO.
ECHO.

ECHO ^|----------------------Powering Off-------------------------^|
ECHO ^|   ^>Press 1 to shutdown the computer.                      ^|
ECHO ^|   ^>Press 2 to restart the computer.                       ^|
ECHO ^|   ^>Press Q to quit.                                       ^|
ECHO ^|-----------------------------------------------------------^|
ECHO.
CHOICE /N /C 12"q" /M ">Input: "%1
IF ERRORLEVEL ==3 GOTO QUIT
IF ERRORLEVEL ==2 GOTO RESTART
IF ERRORLEVEL ==1 GOTO SHUTDOWN

GOTO QUIT
:SHUTDOWN
ECHO shutdow
REM shutdown.exe /f
GOTO QUIT
:RESTART
ECHO restart
REM shutdown.exe /r
:QUIT
ECHO quit
exit

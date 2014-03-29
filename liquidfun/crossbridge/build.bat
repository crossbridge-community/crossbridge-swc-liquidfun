:: Echo off and begin localisation of Environment Variables
@ECHO OFF & SETLOCAL

:: Prepare the Command Processor
VERIFY errors 2>nul
SETLOCAL ENABLEEXTENSIONS
IF ERRORLEVEL 1 ECHO Warning: Unable to enable extensions.
SETLOCAL ENABLEDELAYEDEXPANSION

:: Save base directory
PUSHD %CD%
::PUSHD %~dp0

:: Set title
TITLE %~n0

:: STARTUP
IF NOT EXIST "%FLASCC_ROOT%" IF "%FLASCC_ROOT%" NEQ "" CALL :FLASCC_ROOT_NOT_SET
SET CB_PRJ_DIR=%CD%
%FLASCC_ROOT%/run.bat %CD%/build.sh
GOTO :EXIT

:: ERROR
:FLASCC_ROOT_NOT_SET
ECHO ERROR: FLASCC_ROOT directory is not set.
GOTO :EXIT

:: SHUTDOWN
:EXIT
POPD
ENDLOCAL
PAUSE
EXIT /B 0 
GOTO :EOF
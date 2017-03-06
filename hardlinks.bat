@echo off
REM ------------------------------------------------------------------------------------------
REM Batch file for creating Junctions and hardlinks of the arduino avr files for own board defs
REM Version 1.0 - 06.03.2017 - Dieter Lambrecht
REM ------------------------------------------------------------------------------------------
REM License : You can use this as you want - I will be happy if you send me a postcard
REM 		  ask me for my postal address via email: dieter-l-git@gmx.de		
REM ------------------------------------------------------------------------------------------
REM Directory structure:
REM 
REM	%USERPROFILE%
REM		|_ Documents
REM			|_ Arduino
REM				|_ hardware
REM					|_ %_BOARD_NAME%
REM						|_ %_BOARD_NAME%
REM								|_ boards.txt (custom)
REM								|_ bootloaders (custom booloaders dir)
REM								|_ cores (junction)
REM								|_ libraries (junction)
REM								|_ variants (junction)
REM								|_ platform.txt (hardlink)
REM								|_ programmers.txt (hardlink)
REM
REM	With this structure you can separate your own definitions from the Arduino IDE installation.
REM If you install a new IDe or change the version of the avr compilers- correct the definitions
REM in this batch, run it, and you can see your custom AVR board definitions in your IDE without
REM modifying original IDE definitions and can use the new compiler and libs of the IDE.
REM
REM ------------------------------------------------------------------------------------------
REM --- Version of arduino avr
set _Arduino_AVR_ver=1.6.17
REM --- Custom Board directory name
set _BOARD_NAME=CJMCU-KZQ
REM --- Source path - arduino avr directory
set _SOURCE_DIR=%USERPROFILE%\AppData\Local\arduino15\packages\arduino\hardware\avr\%_Arduino_AVR_ver%
REM --- Target path - whre your custom boards.txt resides
set _TARGET_DIR=%USERPROFILE%\Documents\Arduino\hardware\%_BOARD_NAME%\%_BOARD_NAME%
REM --- only for pretty output
set _Trenner=-----------------------------

@echo %_Trenner%
@echo "Checking source dir"
@echo %_Trenner%
if NOT exist "%_SOURCE_DIR%" goto SOURCEDIR_NOT_EXIST
	@echo "Source directory %_SOURCE_DIR% exists"
	@echo]

@echo %_Trenner%
@echo "Checking target dir"
@echo %_Trenner%
if NOT exist "%_TARGET_DIR%" goto TARGETDIR_NOT_EXIST
	@echo "Target directory %_TARGET_DIR% exists"
	@echo]

@echo %_Trenner%
@echo "cores Junction"
@echo %_Trenner%
if exist _TARGET_DIR%\cores goto MAKE_CORE_LINK
	@echo "Deleting old cores junction"
	@echo]
	rmdir %_TARGET_DIR%\cores
:MAKE_CORE_LINK
@echo "Making junction %_TARGET_DIR%\cores"
@echo]
MKLINK /J %_TARGET_DIR%\cores %_SOURCE_DIR%\cores
@echo]

@echo %_Trenner%
@echo "libraries junction"
@echo %_Trenner%
if exist _TARGET_DIR%\libraries goto MAKE_LIBRARIES_LINK
	@echo "Deleting old libraries junction"
	@echo]
	rmdir %_TARGET_DIR%\libraries
:MAKE_LIBRARIES_LINK
@echo "Making Junction %_TARGET_DIR%\libraries"
@echo]
MKLINK /J %_TARGET_DIR%\libraries %_SOURCE_DIR%\libraries
@echo]

@echo %_Trenner%
@echo "variants junction"
@echo %_Trenner%
if exist _TARGET_DIR%\variants goto MAKE_VARIANTS_LINK
	@echo "Deleting old variants junction"
	@echo]
	rmdir %_TARGET_DIR%\variants
:MAKE_VARIANTS_LINK
@echo "Making Junction %_TARGET_DIR%\variants"
@echo]
MKLINK /J %_TARGET_DIR%\variants %_SOURCE_DIR%\variants
@echo]

@echo %_Trenner%
@echo "programmers.txt Hardlink"
@echo %_Trenner%
if exist _TARGET_DIR%\programmers.txt goto MAKE_PROGRAMMERS_LINK
	@echo "Deleting old programmers.txt hardlink"
	@echo]
	del %_TARGET_DIR%\programmers.txt
:MAKE_PROGRAMMERS_LINK
@echo "Making Hardlink %_TARGET_DIR%\programmers.txt"
@echo]
MKLINK /H %_TARGET_DIR%\programmers.txt %_SOURCE_DIR%\programmers.txt
@echo]

@echo %_Trenner%
@echo "platform.txt Hardlink"
@echo %_Trenner%
if exist _TARGET_DIR%\platform.txt goto MAKE_PLATFORM_LINK
	@echo "Deleting old platform.txt hardlink"
	@echo]
	del %_TARGET_DIR%\platform.txt
:MAKE_PLATFORM_LINK
@echo "Making Hardlink %_TARGET_DIR%\platform.txt"
@echo]
MKLINK /H %_TARGET_DIR%\platform.txt %_SOURCE_DIR%\platform.txt
@echo]

goto END

:SOURCEDIR_NOT_EXIST
@echo "ARDUINO directory %_SOURCE_DIR% doesn't exist"
@echo]
@echo "please check your Arduino IDE installation and your path definitions in this batch file"
@echo]
goto END

:TARGETDIR_NOT_EXIST
@echo "Directory %_TARGET_DIR% existiert nicht"
@echo]
@echo "please check your Arduino IDE installation and your path definitions in this batch file"
@echo]
goto END


:END
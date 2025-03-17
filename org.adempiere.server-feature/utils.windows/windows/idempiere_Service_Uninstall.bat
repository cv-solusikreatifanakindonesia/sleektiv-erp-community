@echo off

REM Adempiere_Service_Uninstall.bat - globalqss - based on http://javaservice.objectweb.org

if (%SLEEKTIV_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %SLEEKTIV_HOME%\utils\myEnvironment.bat Server)

NET STOP idempiere
%SLEEKTIV_HOME%\utils\windows\idempiereService.exe -uninstall idempiere

@Rem $Id: RUN_ApplyPackInFromFolder.bat

@if (%SLEEKTIV_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %SLEEKTIV_HOME%\utils\myEnvironment.bat Server)
@Title Import Translation - %SLEEKTIV_HOME% (%ADEMPIERE_DB_NAME%)

@SET DIRECTORY=%1

@echo This Procedure import packin files from directory %DIRECTORY%
@pause

FOR %%c in (plugins\org.eclipse.equinox.launcher_1.*.jar) DO set JARFILE=%%c
@"%JAVA_HOME%\bin\java" -Dosgi.compatibility.bootdelegation=true -Dosgi.noShutdown=false -jar %JARFILE% -application org.adempiere.base.PackInFolderApplication %DIRECTORY%

@pause

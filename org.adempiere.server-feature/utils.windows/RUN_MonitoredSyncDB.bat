@if (%SLEEKTIV_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %SLEEKTIV_HOME%\utils\myEnvironment.bat Server)
@Title	Synchronize iDempiere Database - %SLEEKTIV_HOME% (%ADEMPIERE_DB_NAME%)

@call %ADEMPIERE_DB_PATH%\SyncDB %ADEMPIERE_DB_USER% %ADEMPIERE_DB_PASSWORD% %ADEMPIERE_DB_PATH%

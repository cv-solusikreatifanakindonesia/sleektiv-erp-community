@Echo	Adempiere Database Export 	$Revision: 1.8 $

@Rem $Id: DBExport.bat,v 1.8 2005/04/27 17:45:01 jjanke Exp $
@Rem 
@Echo Saving database %1@%ADEMPIERE_DB_NAME% to %SLEEKTIV_HOME%\data\ExpDat.dmp

@if (%SLEEKTIV_HOME%) == () goto environment
@if (%ADEMPIERE_DB_NAME%) == () goto environment
@if (%ADEMPIERE_DB_SERVER%) == () goto environment
@if (%ADEMPIERE_DB_PORT%) == () goto environment
@Rem Must have parameter: userAccount
@if (%1) == () goto usage

@Rem Cleanup
@sqlplus -S %1/%2@%ADEMPIERE_DB_SERVER%:%ADEMPIERE_DB_PORT%/%ADEMPIERE_DB_NAME% @%SLEEKTIV_HOME%\utils\%ADEMPIERE_DB_PATH%\Daily.sql

@Rem The Export
@exp %1/%2@%ADEMPIERE_DB_SERVER%:%ADEMPIERE_DB_PORT%/%ADEMPIERE_DB_NAME% FILE=%SLEEKTIV_HOME%\data\ExpDat.dmp Log=%SLEEKTIV_HOME%\data\ExpDat.log CONSISTENT=Y STATISTICS=NONE OWNER=%1

@cd %SLEEKTIV_HOME%\Data
@copy ExpDat.jar ExpDatOld.jar
@jar cvfM ExpDat.jar ExpDat.dmp ExpDat.log

@goto end

:environment
@Echo Please make sure that the enviroment variables are set correctly:
@Echo		SLEEKTIV_HOME	e.g. D:\Adempiere
@Echo		ADEMPIERE_DB_NAME 	e.g. adempiere.adempiere.org

:usage
@echo Usage:	%0 <userAccount>
@echo Examples:	%0 adempiere adempiere

:end

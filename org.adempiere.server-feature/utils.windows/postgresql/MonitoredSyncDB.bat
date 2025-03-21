@Echo	Synchronize iDempiere Database

@Echo Upgrading database %1@%ADEMPIERE_DB_NAME%

@if (%SLEEKTIV_HOME%) == () goto environment
@if (%ADEMPIERE_DB_NAME%) == () goto environment
@if (%ADEMPIERE_DB_SERVER%) == () goto environment
@if (%ADEMPIERE_DB_PORT%) == () goto environment
@Rem Must have parameter: userAccount
@if (%1) == () goto usage

@Echo WARNING: THIS PROGRAM IS NOT DEVELOPED FOR WINDOWS YET - YOU NEED TO APPLY MANUALLY THE PENDING MIGRATION SCRIPTS

@Rem TODO: port postgresql/SyncDB.sh to windows syntax

@goto end

:environment
@Echo Please make sure that the enviroment variables are set correctly:
@Echo		SLEEKTIV_HOME	e.g. D:\ADEMPIERE2
@Echo		ADEMPIERE_DB_NAME 	e.g. adempiere or xe
@Echo		ADEMPIERE_DB_SERVER 	e.g. dbserver.adempiere.org
@Echo		ADEMPIERE_DB_PORT 	e.g. 5432 or 1521

:usage
@echo Usage:		%0 <userAccount>
@echo Examples:	%0 ADEMPIERE/ADEMPIERE

:end

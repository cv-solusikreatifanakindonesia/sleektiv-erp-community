@Rem $Id: RUN_DBRestore.bat,v 1.13 2005/01/22 21:59:15 jjanke Exp $

@if (%SLEEKTIV_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %SLEEKTIV_HOME%\utils\myEnvironment.bat Server)
@Title Restore Adempiere Database from Export - %SLEEKTIV_HOME% (%ADEMPIERE_DB_NAME%)


@echo Re-Create Adempiere User and import %SLEEKTIV_HOME%\data\ExpDat.dmp
@dir %SLEEKTIV_HOME%\data\ExpDat.dmp
@echo == The import will show warnings. This is OK ==
@pause

@Rem Parameter: <systemAccount> <adempiereID> <adempierePwd>
@Rem globalqss - cruiz - 2007-10-09 - added fourth parameter for postgres (ignored in oracle)
@call %ADEMPIERE_DB_PATH%\DBRestoredp system/%ADEMPIERE_DB_SYSTEM% %ADEMPIERE_DB_USER% %ADEMPIERE_DB_PASSWORD% %ADEMPIERE_DB_SYSTEM%

@pause

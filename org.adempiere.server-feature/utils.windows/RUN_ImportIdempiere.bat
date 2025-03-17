@Rem $Id: RUN_ImportIdempiere.bat,v 1.12 2005/01/22 21:59:15 jjanke Exp $

@if (%SLEEKTIV_HOME%) == () (CALL myEnvironment.bat Server) else (CALL %SLEEKTIV_HOME%\utils\myEnvironment.bat Server)
@Title Import idempiere - %SLEEKTIV_HOME% (%ADEMPIERE_DB_NAME%)

SET SUFFIX=
SET SYSUSER=system
if (%ADEMPIERE_DB_PATH%) == (postgresql) SET SUFFIX=_pg
if (%ADEMPIERE_DB_PATH%) == (postgresql) SET SYSUSER=postgres

@echo Re-Create idempiere User and import %SLEEKTIV_HOME%\data\Adempiere.dmp - (%ADEMPIERE_DB_NAME%)
cd %SLEEKTIV_HOME%\data\seed
jar xvf Adempiere%SUFFIX%.jar
cd %SLEEKTIV_HOME%\utils
@dir %SLEEKTIV_HOME%\data\seed\Adempiere%SUFFIX%.dmp
@echo == The import will show warnings. This is OK ==
@pause

@Rem Parameter: <systemAccount> <AdempiereID> <AdempierePwd>
@Rem globalqss - cruiz - 2007-10-09 - added fourth parameter for postgres (ignored in oracle)
@call %ADEMPIERE_DB_PATH%\ImportIdempiere %SYSUSER%/%ADEMPIERE_DB_SYSTEM% %ADEMPIERE_DB_USER% %ADEMPIERE_DB_PASSWORD% %ADEMPIERE_DB_SYSTEM% %SUFFIX%

@call RUN_SyncDB

cd ..
@call sign-database-build-alt

@pause

@Rem	myEnvironment defines the variables used for Adempiere
@Rem	Do not edit directly - use RUN_setup
@Rem	
@Rem	$Id: myEnvironmentTemplate.bat,v 1.12 2005/01/22 21:59:15 jjanke Exp $

@Echo Setting myEnvironment ....
@Rem	Clients only needs
@Rem		SLEEKTIV_HOME
@Rem		JAVA_HOME 
@Rem	Server install needs to check
@Rem		ADEMPIERE_DB_NAME	(for Oracle)
@Rem		passwords

@Rem 	Homes ...
@SET SLEEKTIV_HOME=@SLEEKTIV_HOME@
@SET JAVA_HOME=@JAVA_HOME@


@Rem	Database ...
@SET ADEMPIERE_DB_SERVER=@ADEMPIERE_DB_SERVER@
@SET ADEMPIERE_DB_USER=@ADEMPIERE_DB_USER@
@SET ADEMPIERE_DB_PASSWORD=@ADEMPIERE_DB_PASSWORD@
@SET ADEMPIERE_DB_URL=@ADEMPIERE_DB_URL@
@SET ADEMPIERE_DB_PORT=@ADEMPIERE_DB_PORT@

@Rem	Oracle specifics
@SET ADEMPIERE_DB_PATH=@ADEMPIERE_DB_PATH@
@SET ADEMPIERE_DB_NAME=@ADEMPIERE_DB_NAME@
@SET ADEMPIERE_DB_SYSTEM=@ADEMPIERE_DB_SYSTEM@

@Rem	Homes(2)
@SET ADEMPIERE_DB_HOME=@SLEEKTIV_HOME@\utils\@ADEMPIERE_DB_TYPE@
@SET JBOSS_HOME=@SLEEKTIV_HOME@\jboss

@Rem	Apps Server
@SET ADEMPIERE_APPS_TYPE=@ADEMPIERE_APPS_TYPE@
@SET ADEMPIERE_APPS_SERVER=@ADEMPIERE_APPS_SERVER@
@SET ADEMPIERE_JNP_PORT=@ADEMPIERE_JNP_PORT@
@SET ADEMPIERE_WEB_PORT=@ADEMPIERE_WEB_PORT@
@SET ADEMPIERE_APPS_DEPLOY=@ADEMPIERE_APPS_TYPE@
@Rem	SSL Settings
@SET ADEMPIERE_SSL_PORT=@ADEMPIERE_SSL_PORT@
@SET ADEMPIERE_KEYSTORE=@ADEMPIERE_KEYSTORE@
@SET ADEMPIERE_KEYSTOREWEBALIAS=@ADEMPIERE_KEYSTOREWEBALIAS@
@SET ADEMPIERE_KEYSTOREPASS=@ADEMPIERE_KEYSTOREPASS@

@Rem	Java
@SET ADEMPIERE_JAVA=@JAVA_HOME@\bin\java
@SET IDEMPIERE_JAVA_OPTIONS=@IDEMPIERE_JAVA_OPTIONS@ -DSLEEKTIV_HOME=@SLEEKTIV_HOME@
@SET CLASSPATH="@SLEEKTIV_HOME@\lib\Adempiere.jar;@SLEEKTIV_HOME@\lib\AdempiereCLib.jar;"

@Rem Save Environment file
@if (%1) == () copy utils\myEnvironment.bat utils\myEnvironment_%RANDOM%.bat /Y 


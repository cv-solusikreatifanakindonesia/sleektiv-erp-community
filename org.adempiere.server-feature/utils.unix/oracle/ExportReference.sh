#!/bin/sh

echo    iDempiere Database Export       "$Revision": 1.5 $

# $Id: ExportReference.sh,v 1.5 2005/12/20 07:12:17 jjanke Exp $

echo Saving reference database reference@"$ADEMPIERE_DB_NAME" to "$SLEEKTIV_HOME"/data/Adempiere.dmp

if [ "$SLEEKTIV_HOME" = "" ] || [ "$ADEMPIERE_DB_NAME" = "" ]
  then
    echo "Please make sure that the environment variables are set correctly:"
    echo "      SLEEKTIV_HOME  e.g. /idempiere"
    echo "      ADEMPIERE_DB_NAME       e.g. adempiere.adempiere.org"
    exit 1
fi

echo -------------------------------------
echo Re-Create DataPump directory
echo -------------------------------------
sqlplus -S "$3"@"$ADEMPIERE_DB_SERVER":"$ADEMPIERE_DB_PORT"/"$ADEMPIERE_DB_NAME" @"$SLEEKTIV_HOME"/utils/"$ADEMPIERE_DB_PATH"/CreateDataPumpDir.sql "$SLEEKTIV_HOME"/data
chgrp dba "$SLEEKTIV_HOME"/data
chmod 770 "$SLEEKTIV_HOME"/data

if [ "x${1,,}" != "xreference" ]
then
    sqlplus -S "$3"@"$ADEMPIERE_DB_SERVER":"$ADEMPIERE_DB_PORT"/"$ADEMPIERE_DB_NAME" <<!
DROP USER REFERENCE CASCADE;
alter session set "_enable_rename_user"=true;
alter system enable restricted session;
ALTER USER $1 RENAME TO REFERENCE IDENTIFIED BY "$2";
alter system disable restricted session;
!
fi

rm -f "$SLEEKTIV_HOME"/data/Adempiere.dmp "$SLEEKTIV_HOME"/data/Adempiere.log
# Export
expdp REFERENCE/"$2"@"$ADEMPIERE_DB_SERVER":"$ADEMPIERE_DB_PORT"/"$ADEMPIERE_DB_NAME" DIRECTORY=ADEMPIERE_DATA_PUMP_DIR DUMPFILE=Adempiere.dmp LOGFILE=Adempiere.log EXCLUDE=STATISTICS SCHEMAS=REFERENCE

if [ "x${1,,}" != "xreference" ]
then
    sqlplus -S "$3"@"$ADEMPIERE_DB_SERVER":"$ADEMPIERE_DB_PORT"/"$ADEMPIERE_DB_NAME" <<!
alter session set "_enable_rename_user"=true;
alter system enable restricted session;
ALTER USER REFERENCE RENAME TO $1 IDENTIFIED BY "$2";
alter system disable restricted session;
!
fi

cd "$SLEEKTIV_HOME"/data || exit
jar cvfM Adempiere.jar Adempiere.dmp Adempiere.log

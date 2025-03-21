#!/bin/sh

echo	iDempiere Full Database Export 	"$Revision": 1.3 $

# $Id: DBExportFull.sh,v 1.3 2005/01/22 21:59:15 jjanke Exp $

DATE=$(date +%Y%m%d_%H%M%S)
echo Saving database "$1"@"$ADEMPIERE_DB_NAME" to "$SLEEKTIV_HOME"/data/ExpDatFull_"$DATE".dmp

if [ $# -eq 0 ]
  then
    echo "Usage:		$0 <systemAccount>"
    echo "Example:	$0 system/manager"
    exit 1
fi
if [ "$SLEEKTIV_HOME" = "" ] || [ "$ADEMPIERE_DB_NAME" = "" ]
  then
    echo "Please make sure that the environment variables are set correctly:"
    echo "	SLEEKTIV_HOME	e.g. /idempiere"
    echo "	ADEMPIERE_DB_NAME	e.g. adempiere.adempiere.org"
    exit 1
fi

echo -------------------------------------
echo Re-Create DataPump directory
echo -------------------------------------
sqlplus -S "$1"@"$ADEMPIERE_DB_SERVER":"$ADEMPIERE_DB_PORT"/"$ADEMPIERE_DB_NAME" @"$SLEEKTIV_HOME"/utils/"$ADEMPIERE_DB_PATH"/CreateDataPumpDir.sql "$SLEEKTIV_HOME"/data
chgrp dba "$SLEEKTIV_HOME"/data
chmod 770 "$SLEEKTIV_HOME"/data

expdp "$1"@"$ADEMPIERE_DB_SERVER":"$ADEMPIERE_DB_PORT"/"$ADEMPIERE_DB_NAME" DIRECTORY=ADEMPIERE_DATA_PUMP_DIR DUMPFILE=ExpDatFull_"$DATE".dmp LOGFILE=ExpDatFull_"$DATE".log EXCLUDE=STATISTICS FULL=Y

cd "$SLEEKTIV_HOME"/data || exit
jar cvfM ExpDatFull.jar ExpDatFull_"$DATE".dmp  ExpDatFull_"$DATE".log


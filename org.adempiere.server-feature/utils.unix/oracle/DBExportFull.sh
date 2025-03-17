#!/bin/sh

echo	iDempiere Full Database Export 	"$Revision": 1.3 $

# $Id: DBExportFull.sh,v 1.3 2005/01/22 21:59:15 jjanke Exp $

echo Saving database "$1"@"$ADEMPIERE_DB_NAME" to "$SLEEKTIV_HOME"/data/ExpDatFull.dmp

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

exp "$1"@"$ADEMPIERE_DB_SERVER":"$ADEMPIERE_DB_PORT"/"$ADEMPIERE_DB_NAME" FILE="$SLEEKTIV_HOME"/data/ExpDatFull.dmp Log="$SLEEKTIV_HOME"/data/ExpDatFull.log CONSISTENT=Y STATISTICS=NONE FULL=Y

cd "$SLEEKTIV_HOME"/data || exit
jar cvfM ExpDatFull.jar ExpDatFull.dmp  ExpDatFull.log


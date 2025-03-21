#!/bin/sh

# Author + Copyright 1999-2005 Jorg Janke
# $Id: RUN_DBExport.sh,v 1.10 2005/05/31 18:45:33 jjanke Exp $
if [ "$SLEEKTIV_HOME" ]; then
  cd "$SLEEKTIV_HOME"/utils || (echo "Cannot cd $SLEEKTIV_HOME/utils"; exit 1)
fi
export ID_ENV=Server
. ./myEnvironment.sh
echo 	Export idempiere Database - "$SLEEKTIV_HOME" \("$ADEMPIERE_DB_NAME"\)


# Parameter: <adempiereDBuser>/<adempiereDBpassword>
sh "$ADEMPIERE_DB_PATH"/DBExportdp.sh "$ADEMPIERE_DB_USER" "$ADEMPIERE_DB_PASSWORD" system/"$ADEMPIERE_DB_SYSTEM"

# sh $ADEMPIERE_DB_PATH/DBExportFulldp.sh system/$ADEMPIERE_DB_SYSTEM

if [ "$SLEEKTIV_HOME" ]; then
  cd "$SLEEKTIV_HOME"/utils || (echo "Cannot cd $SLEEKTIV_HOME/utils"; exit 1)
fi
sh myDBcopy.sh


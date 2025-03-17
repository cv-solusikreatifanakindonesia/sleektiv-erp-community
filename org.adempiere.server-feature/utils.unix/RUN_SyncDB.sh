#!/bin/sh

# Author Carlos Ruiz
if [ "$SLEEKTIV_HOME" ]; then
  cd "$SLEEKTIV_HOME"/utils || (echo "Cannot change to $SLEEKTIV_HOME/utils"; exit 1)
fi
export ID_ENV=Server
. ./myEnvironment.sh
echo 	Synchronize iDempiere Database - "$SLEEKTIV_HOME" \("$ADEMPIERE_DB_NAME"\)

sh "$ADEMPIERE_DB_PATH"/SyncDB.sh "$ADEMPIERE_DB_USER" "$ADEMPIERE_DB_PASSWORD" "$ADEMPIERE_DB_PATH" $*

#!/bin/sh

# $Id: RUN_DBRestore.sh,v 1.9 2005/01/22 21:59:15 jjanke Exp $
if [ "$SLEEKTIV_HOME" ]; then
    cd "$SLEEKTIV_HOME"/utils || (echo "Cannot cd $SLEEKTIV_HOME/utils"; exit 1)
fi
export ID_ENV=Server
. ./myEnvironment.sh
echo Restore idempiere Database from Export- "$SLEEKTIV_HOME" \("$ADEMPIERE_DB_NAME"\)


echo Re-Create idempiere User and import "$SLEEKTIV_HOME"/data/ExpDat.dmp
echo "== The import will show warnings. This is OK =="
ls -lsa "$SLEEKTIV_HOME"/data/ExpDat.dmp
echo Press enter to continue ...
read -r _

# Parameter: <systemAccount> <adempiereID> <adempierePwd>
# globalqss - cruiz - 2007-10-09 - added fourth parameter for postgres(ignored in oracle)
"$ADEMPIERE_DB_PATH"/DBRestoredp.sh system/"$ADEMPIERE_DB_SYSTEM" "$ADEMPIERE_DB_USER" "$ADEMPIERE_DB_PASSWORD" "$ADEMPIERE_DB_SYSTEM"

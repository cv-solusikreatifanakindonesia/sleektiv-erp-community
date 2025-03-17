#!/bin/sh

# $Id: RUN_DBStart.sh,v 1.4 2005/01/22 21:59:15 jjanke Exp $
if [ "$SLEEKTIV_HOME" ]; then
    cd "$SLEEKTIV_HOME"/utils || (echo "Cannot cd $SLEEKTIV_HOME/utils"; exit 1)
fi
export ID_ENV=Server
. ./myEnvironment.sh
echo Start DataBase Service - "$SLEEKTIV_HOME" \("$ADEMPIERE_DB_NAME"\)


sh "$ADEMPIERE_DB_PATH"/Start.sh


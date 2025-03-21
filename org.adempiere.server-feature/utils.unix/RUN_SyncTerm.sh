#!/bin/sh

if [ "$SLEEKTIV_HOME" ]; then
    cd "$SLEEKTIV_HOME"/utils || (echo "Cannot cd $SLEEKTIV_HOME/utils"; exit 1)
else
    cd "$(dirname "$0")" || (echo "Cannot cd"; exit 1)
fi
export ID_ENV=Server
. ./myEnvironment.sh

if [ "$JAVA_HOME" ]; then
  JAVA=$JAVA_HOME/bin/java
else
  JAVA=java
fi

# RUN_SyncTerm.sh
echo    Synchronize idempiere Terminology - "$SLEEKTIV_HOME" \("$ADEMPIERE_DB_NAME"\)

cd ..

echo    This Procedure synchronize terminology

"$JAVA" -Dosgi.compatibility.bootdelegation=true -Dosgi.noShutdown=false -jar plugins/org.eclipse.equinox.launcher_1.*.jar -install setup -application org.adempiere.install.translation sync

echo    Done
echo .
echo For problems, check log file in base directory

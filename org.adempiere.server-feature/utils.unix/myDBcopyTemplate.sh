#!/bin/sh

# Copy Database after backup
# $Id: myDBcopyTemplate.sh,v 1.1 2002/10/07 01:23:32 jjanke Exp $

DATE=$(date +%Y%m%d_%H%M%S)
mv "$SLEEKTIV_HOME"/data/ExpDat.jar "$SLEEKTIV_HOME"/data/ExpDat"$DATE".jar
echo copy "$SLEEKTIV_HOME"/data/ExpDat"$DATE".jar to backup media

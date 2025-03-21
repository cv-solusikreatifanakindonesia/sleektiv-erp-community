/*************************************************************************
 * The contents of this file are subject to the Adempiere License.  You may
 * obtain a copy of the License at    http://www.adempiere.org/license.html 
 * Software is on an  "AS IS" basis,  WITHOUT WARRANTY OF ANY KIND, either 
 * express or implied. See the License for details. Code: Adempiere ERP+CRM
 * Copyright (C) 1999-2003 Jorg Janke, ComPiere, Inc. All Rights Reserved.
 *************************************************************************
 * $Id: Stop.sql,v 1.1 2006/04/21 17:51:58 jjanke Exp $
 ***
 * Title:	Stop Database and save configuration in trace
 * Description:	
 *	Start the script via 
 *	sqlplus "system/$ADEMPIERE_DB_SYSTEM AS SYSDBA" @$SLEEKTIV_HOME/utils/$ADEMPIERE_DB_PATH/Stop.sql
 ************************************************************************/
set pause off
set echo on
ALTER DATABASE BACKUP CONTROLFILE TO TRACE;
shutdown transactional
exit

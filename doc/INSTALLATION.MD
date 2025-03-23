# Sleektiv ERP Community - Full Open Source Business Suite ERP/CRM/MFG/SCM/POS Software for Community

Sleektiv ERP Community done the community way.  Focus is on the Community that includes Subject Matter Specialists, Implementors and End-Users.

# System Requirement 

    1. Openjdk version "java-17-openjdk"
    2. Apache Maven 3.9.9
    3. PostgreSQL

# Step by Step 

# Setting Up Sleektiv ERP Community Version 1

Follow these steps to install and configure **Sleektiv ERP Community Version 1**.

---

## 1. Build the Project
```sh
mvn verify
mvn clean install -U -X

2. Open Eclipse and Configure Maven

    Open Eclipse and set the cloned Sleektiv ERP Community Version 1 as the workspace.

    Navigate to:
    Window → Preferences → Maven → Discovery → Open Catalog.

    Search for Tycho Configurator and install it.

    Restart Eclipse.

3. Configure Eclipse Workspace

    Go to: Window → Preferences → General → Workspace.

    Set New text file delimiter to Other: Unix.

    Navigate to: Java → Compiler.

        Change Compiler compliance level to 11.

    Navigate to: Java → Installed JREs.

        Click Add → Standard VM.

        Select the JDK installed in Step 1.

        Mark this JDK as Default.

4. Import the Project

    Disable Build Automatically:
    Project → Uncheck Build Automatically.

    Import the project:

        File → Import → Maven → Existing Maven Projects.

        Select the folder where Sleektiv ERP Community Version 1 is installed.

    Set the target platform:

        Open: org.idempiere.p2.targetplatform/org.idempiere.p2.targetplatform.target.

        Click Set as Active Target Platform.

    Enable Build Automatically:
    Project → Check Build Automatically.

5. Install the Application

    Open Run Configurations:

        Run → Run Configurations → install.app.

    Fill the DB Admin Password field with the PostgreSQL password from Step 5.

    Allow any access blocked by Windows Defender.

6. Set Up PostgreSQL Database

Open Command Line and run the following commands:

psql -U postgres -c "CREATE ROLE sleektiv SUPERUSER LOGIN PASSWORD 'yourpassword'"
createdb --template=template0 -E UNICODE -O sleektiv -U sleektiv sleektiv_erp_community
psql -d sleektiv_erp_community -U sleektiv -c "ALTER ROLE sleektiv SET search_path TO sleektiv, pg_catalog"
psql -W -h [your db hostname] -d sleektiv_erp_community -U sleektiv -f Sleektiv_pg.dmp

7. Sync Database

    Open Git Bash.

    Navigate to the Sleektiv ERP Community root folder.

    Run the following command:

    bash RUN_SyncDBDev.sh

8. Run the Server

    Open Eclipse.

    Navigate to Run Configurations.

        Run → Run Configurations → server.product → Run.

9. Access the ERP System

    Open a web browser.

    Navigate to:
    https://127.0.0.1:8443

    Login using the default credentials:

        Username: SuperUser

        Password: System

    Change the default password after the initial installation.
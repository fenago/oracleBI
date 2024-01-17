
# Oracle BI Publisher 12c Lab: 

This lab exercise is designed to familiarize you with Strawberry Perl and Oracle Database Sample Schemas. Please follow the steps below to complete the lab.

## Prerequisites

Ensure that you have administrative access to your Virtual Machine and an active internet connection.

## Instructions

### Step 1: Install Strawberry Perl

1. Download Strawberry Perl from the official website: [Strawberry Perl](https://strawberryperl.com/).
2. Follow the installation instructions provided on the website to install Strawberry Perl on your Virtual Machine.

### Step 2: Download the Replace Script

1. Download `replace_script.pl` from the GitHub repository:
   ```
   https://github.com/fenago/oracleBI/blob/master/replace_script.pl
   ```

### Step 3: Set Up Oracle Database Sample Schemas

1. Download the Oracle Database Sample Schemas for 19.2 from the following link: [Oracle Database Sample Schemas v19.2](https://github.com/oracle-samples/db-sample-schemas/archive/refs/tags/v19.2.zip).
2. Unzip the downloaded file.

### Step 4: Prepare the Environment

1. Navigate to the `db-sample-schemas-19.2` directory that was extracted from the zip file.
2. Copy the `replace_script.pl` script into the `db-sample-schemas-19.2` directory.

### Step 5: Run the Replace Script

1. Launch the Strawberry Perl Command Line interface.
2. Change directory to the `db-sample-schemas-19.2` directory using `cd` command.
3. Execute the script by running:
   ```
   perl replace_script.pl
   ```

### Step 6: Configure Oracle Sample Schemas

1. Open PowerShell and navigate to your `db-sample-schemas-19.2` directory.
2. Connect to your Oracle database as SYSDBA:
   ```
   sqlplus / as sysdba
   ```
3. Run the following commands to set up the sample schemas:
   ```
   CONNECT system/fenago
   @mksample
   ```

while this is running - these are the values to put in:

 fenago fenago hr oe pm ix sh bi users temp C:\Oracle\Middleware\Oracle_Home\logs localhost:1521/orclpdb

**Note:** Make sure to follow each step carefully and consult your instructor if you encounter any issues.

This will load the OE environment.  After that - please complete lab 4.2

IMPORTANT:  the connection string in 4.2 is:  jdbc:oracle:thin:@localhost:1521/orclpdb     (make sure to note the / and not the : at the end)

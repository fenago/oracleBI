## Installation of the Oracle19c Sample Schemas

Oracle provides the following sample schemas:
`HR, OE, OC, PM`, and `SH`. You must
download the installable zip file from the GitHub repository to use the
sample schemas.


This section includes the following topics:

- Installing the Sample Schemas
- Installing the HR Schema
- Installing the CO schema



### Installing the Sample Schemas


The Sample Schemas can be installed together using a single script.


The procedure to install sample schemas is as follows:

1.  To find the latest version of the sample schemas installation
    scripts, go to the following GitHub location.

    For example, If you want a 19.2 version of the scripts, then go to
    the following location:
    ```
    https://github.com/oracle/db-sample-schemas/releases/tag/v19.2
    ```

2.  Clone the GitHub repository, or download the ZIP bundle from GitHub
    and extract the files.

3.  Change directory to `db-sample-schemas-19.2` in cmd terminal.

4.  Use the following syntax from the SQL\*Plus command-line interface:

    **Sample Command**

    ```
    sqlplus / as sysdba

    CONNECT system/systempw

    @mksample systempw syspw hrpw oepw pmpw ixpw shpw bipw users temp /your/path/to/log/ connect_string
    ```

    ```
    sqlplus / as sysdba

    CONNECT system/fenago

    @mksample fenago fenago fenago fenago fenago fenago fenago fenago users temp C:\App\oracle\demo\schema\log \ localhost:1521/orclpdb1
    ```

    You can also follow the instructions in the README file contained in
    the zip file.

    The `mksample` script expects 11 parameters. Provide the
    password for `SYSTEM` and `SYS`, and for schemas
    `HR`, `OE`, `PM`, `IX`, and
    `SH`. Specify a temporary tablespace and a default
    tablespace, and make sure that you end the name of the log file
    directory with a trailing slash.



The `mksample` script produces the following log files:

-   `mkverify.log` - This is the Sample Schema creation log
    file.

-   `hr_main.log` - This is the `HR` schema creation
    log file.

-   `oe_oc_main.log` - This is the `OE` schema
    creation log file.

-   `pm_main.log` - This is the `PM` schema creation
    log file.

-   `pm_p_lob.log` - This is the SQL\*Loader log file for
    `PM.PRINT_MEDIA`.

-   `ix_main.log` - This is the `IX` schema creation
    log file.

-   `sh_main.log` - This is the `SH` schema creation
    log file.

-   `cust.log` - This is the SQL\*Loader log file for
    `SH.CUSTOMERS`.

-   `prod.log` - This is the SQL\*Loader log file for
    `SH.PRODUCTS`.

-   `promo.log` - This is the SQL\*Loader log file for
    `SH.PROMOTIONS`.

-   `sales.log` - This is the SQL\*Loader log file for
    `SH.SALES`.

-   `sales_ext.log` - This is the external table log file for
    `SH.COSTS`.


Note:


- Only `HR` and `SH` schemas can be installed independently. The rest of the schemas have dependencies and must be installed together using the @mksample script.
- The master script `@mksample` currently does not include the `CO` schema. You must install it separately.
- By installing any of the Oracle Database sample schemas, you drop
    any previously installed schemas that use the following user names:
    `HR`, `OE`, `PM`, `SH`,
    `IX`, `BI`, `CO`.
- Data contained in any of these schemas is lost if you run any of the
    installation scripts described in this section.





### Installing the HR Schema


You can install the HR schema independently. All scripts necessary to
create the Human Resource (`HR`) schema reside in the
`human_resources` folder of the sample schema installation
scripts downloaded earlier. You need to call only one script,
`hr_main.sql`, to create all the objects and load the data.


Perform the following steps to install the `HR` schema:

1.  Download the sample schema installation zip from GitHub and extract
    the files.

2.  Navigate to the `human_resources` folder.

3.  Log on to SQL\*Plus as `SYS` and `connect` using
    the `AS SYSDBA` privilege:

    ```
    sqlplus connect sys as sysdba
    Enter password: password
    ```

4.  To run the `hr_main.sql` script, use the following command:

    ```
    SQL> @hr_main.sql
    ```

5.  Enter a secure password for `HR`:

    ```
    specify password for HR as parameter 1:
    Enter value for 1:
    ```

6.  Enter an appropriate tablespace, for example, `users` as
    the default tablespace for `HR`:

    ```
    specify default tablespace for HR as parameter 2:
    Enter value for 2:
    ```

7.  Enter `temp` as the temporary tablespace for `HR`:

    ```
    specify temporary tablespace for HR as parameter 3:
    Enter value for 3:
    ```

8.  Enter the password for `SYS`:

    ```
    specify password for SYS as parameter 4:
    Enter value for 4:
    ```

9.  Enter the directory path, for example,
    `C:\App\oracle\demo\schema\log \`, for
    your log directory:

    ```
    specify log path as parameter 5:
    Enter value for 5:
    ```

After the `hr_main.sql` script runs successfully and the
`HR` schema is installed, you are connected as user
`HR.` To verify that the schema was created, use the following
command:

```
SQL> SELECT table_name FROM user_tables;
```

Running `hr_main.sql` accomplishes the following tasks:


1.  Removes any previously installed `HR` schema.
2.  Creates user `HR` and grants the necessary privileges.
3.  Connects as `HR`.
4.  Calls the scripts that create and populate the schema objects.


A pair of optional scripts, `hr_dn_c.sql` and
`hr_dn_d.sql`, is provided as a schema extension. To prepare
schema `HR` for use with the directory capabilities of Oracle
Internet Directory, run the `hr_dn_c.sql` script. If you want
to return to the initial setup of schema `HR`, use the
`hr_dn_d.sql` script to undo the effects of the
`hr_dn_c.sql` script.




Note:

Similarly SH schema can be installed independently.





### Installing the CO schema

You can install the `CO` schema independently from GitHub. You
cannot install the `CO` schema as part of the
`@mksample` script.


The steps to install `CO` schema from GitHub is as follows:


1.  Go to the following GitHub location:

    ```
    https://github.com/oracle/db-sample-schemas/releases/tag/v19.2
    ```

2.  Clone the GitHub repository, or download the ZIP bundle from GitHub
    and extract the files.
3.  Navigate to the `customer_orders` folder.
4.  Follow the instructions in the `README.txt` present in the
    `customer_orders` folder.
5.  Review the `co_install.log` file in the extracted zip
    folder for errors.
6.  To verify that the schema was created, use the following command:


    ```
    SQL> SELECT table_name FROM user_tables;
    ```

7.  To drop the `CO` schema, run the following script:


    ```
    SQL> @co_drop_user.sql
    ```




Note:

-   The Customer Orders(`CO`) schema is available from Oracle
    Database 12c onwards.
-   The master script `@mksample` currently does not include
    the `CO` schema.


use File::Find;
```
use Cwd;

# Set the current working directory
my $cwd = 'C:\\Oracle\\Middleware\\Oracle_Home\\demo\\schema\\';

# Escape backslashes for regex
(my $escaped_cwd = $cwd) =~ s/\\/\\\\/g;

# Function to process each file
sub process_file {
    # Skip directories
    return if -d;

    # Read in the file
    local @ARGV = ($_);
    local $^I = '.bak'; # create a backup with .bak extension
    while (<>) {
        s/__SUB__CWD__/$escaped_cwd/g;
        print;
    }
}

# Recursively find and process files
find(\&process_file, $cwd);
```
perl replace_script.pl


To start or restart Oracle BI Publisher (BIP) 12c, which is part of the Oracle Business Intelligence suite, you'll typically need to follow these steps. Given that you have installed it with default settings, the process should be straightforward:

Start the WebLogic Server:

First, you need to start the WebLogic Server, as BI Publisher runs on top of it.
Navigate to the WebLogic Server domain directory in your Oracle BI installation. It's usually located in a path similar to <Middleware_Home>/user_projects/domains/bi.
To start the WebLogic Server, run the startWebLogic.sh script on Linux or startWebLogic.cmd on Windows.
Log into WebLogic Server Console:

Once the WebLogic Server is up, you can access the WebLogic Server Console through a web browser at http://localhost:7001/console.
Log in with your WebLogic Server administrator credentials.
Start BI Publisher:

In the WebLogic Server Console, navigate to the 'Services' section, then to 'Data Sources', and ensure that the data sources required by BI Publisher are correctly configured and running.
Then, go to the 'Deployments' section. Here, you should find Oracle BI Publisher listed.
Start (or restart) BI Publisher by selecting it and clicking on the 'Start' or 'Restart' button.
Accessing BI Publisher:

Once BI Publisher is running, you can access the BI Publisher console through your web browser at http://localhost:9502/xmlpserver.
If this URL doesn't work, check the port number and URL context as they might be different based on your installation.
Troubleshooting:

If you face any issues, check the log files located in the <Middleware_Home>/user_projects/domains/bi/servers/AdminServer/logs for the WebLogic Server and <Middleware_Home>/user_projects/domains/bi/servers/bi_server1/logs for BI Publisher.
Scripts for Automation:

For automating these steps, you can write shell scripts (on Linux) or batch files (on Windows) that encapsulate these commands.
Stop BI Publisher:

To stop BI Publisher, you can reverse the process. First, stop BI Publisher from the WebLogic Server Console, then stop the WebLogic Server using the stopWebLogic.sh (or .cmd) script.
Remember, the actual paths and procedures may vary slightly depending on your specific installation and the version of the software. Always refer to the Oracle BI Publisher documentation for the most accurate and detailed instructions.



To start the bi_server1 managed server from the command line without involving the Node Manager, you can use the startManagedWebLogic script. This script is located in your domain's bin directory. Here's what you need to do:

Open a command prompt or PowerShell window.

Change directory to your domain's bin directory using the cd command. It will look something like this:

shell
Copy code
cd C:\Oracle\Middleware\Oracle_Home\user_projects\domains\<your_domain_name>\bin
Replace <your_domain_name> with the actual name of your domain.

Run the startManagedWebLogic script with the bi_server1 managed server name and the Admin Server URL as arguments. Here's the command:

shell
Copy code
.\startManagedWebLogic.cmd bi_server1 http://localhost:9500
Make sure to replace

http://localhost:9500 with the actual URL and port of your Admin Server if it's different.

You may be prompted to enter the username and password for the WebLogic Server. Enter the credentials that you use to log into the WebLogic Server Administration Console.

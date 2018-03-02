# SQLScripts-VESQL
SQL Server Scripts for learning use in Veeam Explorer for SQL Server (non-DBAs)


# VeeamHub
Veeamhub projects are community driven projects, and are not created by Veeam R&D nor validated by Veeam Q&A. They are maintained by community members which might be or not be Veeam employees.

# Distributed under MIT license
Copyright (c) 2018 VeeamHub
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Project Notes
Author: Rick Vanover
Function: These SQL Scripts will allow you to learn capabilities of Veeam Explorer for SQL Server (VESQL) by generating random data and delete events.

This works on all modern versions of Microsoft SQL Server (up to SQL 2017) with the database services engine in place. A few things are required to make the scripts work, namely a drive path for SQL data and log storage. This test data is built with the following storage requirements:
•	Have an S: drive
•	Have an S:\SQLDATA folder
•	Have an S:\SQLLOGS folder
•	Active Directory authentication is enabled
Many production database server implementations use other disk and folder arrangements; so this is a good way to distinguish between production databases and this test database. If a drive letter other than S:\ must be used, change the two instances of S:\SQLDATA\ to a desired path in the first SQL script. 
The following scripts are in this repository and should be run in this order:
•	1vesql_createdb.sql – This will create a database named SQLGREENDREAM. In this database is no data, but tables are in place for the random data. This will make a database and log file size of approximately 20 MB each. This also will create two stored procedures, one to insert a row or random date – the other to delete a row of random data. 
•	2vesql_createview_and_data_generator.sql – This creates a view and a random data generator function outlined from http://vadivel.blogspot.com, a former SQL Server MVP.
•	3vesql_sqlserveragentjob.sql – This script will create a SQL Server Agent job that will insert 2 records of random data into the dbo.tblEmployee table. **NOTE**  On line 31, replace “DOMAIN\username” with an Active Directory username currently being used to run these scripts in SQL Server Management Studio. This script will fail with a message similar to: “The specified '@owner_login_name' is invalid (valid values are returned by sp_helplogins [excluding Windows NT groups])” if this step is omitted.
The result is that every 12 minutes, 2 records will be inserted into the SQLGREENDREAM database and then 1 record deleted. This makes for a nice learning mechanism in Veeam Explorer for SQL Server restore tasks to see a ‘drop’ of a data record to use as a simulation of restore activity with VESQL.


Once all testing is complete, the delete_vesql_randomdatajob.sql job can be used to delete the SQL Server Agent job to avoid needlessly putting in 1 records every 12 minutes if desired. 

/*
===============================================================
 Purpose:
   This script drops and recreates the 'DataWarehouse' database.
   It ensures safe removal of any existing instance by forcing
   single-user mode and rolling back active connections.
   After recreation, it sets up the core schemas:
     - bronze: raw ingested data
     - silver: cleansed and transformed data
     - gold: curated, analytics-ready data

 Usage:
   Run this script in SQL Server Management Studio (SSMS)
   connected to the 'master' database.

 Notes:
   - Ensure no critical workloads are running before execution.
   - Modify schema names if project conventions differ.

WARNING:  
Running this script will drop the entire 'Datawarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.
===============================================================
*/


USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

--Create Database 'DataWarehouse'

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

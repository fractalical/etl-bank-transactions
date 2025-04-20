## Project Description

This is a Data Warehouse/ETL project that implements a star schema design for retail data analysis. The project includes:

### Data Structure
- Fact table containing transactional data
- Dimension tables:
  - Customer dimension
  - Store dimension
  - Item dimension
  - Time dimension
  - Transaction dimension

### Project Components
- Raw data files in CSV format
- Database schemas and table definitions
- SQL queries for data analysis
- Database backup and restore procedures

### Purpose
This data warehouse is designed to facilitate business intelligence and analytics operations, enabling efficient querying and analysis of retail transactions across different dimensions like customer behavior, store performance, and product sales.

#### Star Schema

![Star Schema](./schemas/star_schema.png)

#### Example of uploading data from flat file

![STA](./storage/images/sta_customer_dim.png)

#### Example of cleaning data from STA db and upload to ODS db

![STA](./storage/images/ods_customer_dim.png)


## How to start the project

### 1. Clone the project
```bash
git clone https://github.com/fractalical/etl-bank-transactions.git
```
Or download ZIP archive from repository and extract it to your local machine.

### 2. Create and switch to your feature branch
```bash
cd etl-bank-transactions
git checkout -b feature/your-feature-name
```

### 3. Save your changes
After making changes to the project, save them to your branch:
```bash
git add .
git commit -m "Description of your changes"
git push origin feature/your-feature-name
```

### 4. Open project in Visual Studio 2022
- Launch Visual Studio 2022
- Go to File -> Open -> Project/Solution
- Navigate to the project folder and select `group_project_DSTI.sln`
- Wait for Visual Studio to load all dependencies

### 5. Configure SQL Server connection
1. Install SQL Server and SQL Server Management Studio (SSMS) if not already installed
2. In SSMS:
   - Connect to your local SQL Server instance
   - Create new databases: STA, ODS, and DWH
   - Execute SQL scripts from `database_scripts` folder to create necessary tables

3. Update connection strings in the project:
   - Open Solution Explorer in Visual Studio
   - For each ODS*.dtsx file:
     - Double click to open
     - Go to Connection Managers at the bottom
     - Right-click on "MSSQL" connection -> Edit
     - Update Server name: `localhost` or your SQL Server instance name
     - Select authentication method and provide credentials
     - Test the connection and click OK

### 6. Configure Flat File Connections
1. In Visual Studio, open each SSIS package that uses flat files
2. In Connection Managers:
   - Right-click on flat file connection -> Edit
   - Update the file path to point to: `[Your Project Path]\storage\csv_data`
   - Verify the file format settings
   - Click OK to save


#### Example of connections

![con](./storage/images/connections.png)

## How to Restore a Database from a Backup (.bak)
1. Right-click on Databases in SQL Server Management Studio (SSMS)

2. Select Restore Database...

3. In the restore wizard:

- Choose Device

- Click ... and browse to your .bak file

4. Follow the wizard steps and click OK to restore the database

5. #### Report with power Bi :
6. ![con](./storage/images/Power_BI_sales.png)
8. ![con](./storage/images/Power_Bi_Top_customers.png)
9. ![con](./storage/images/power_bi_TOP5_product.png)
10. ![con](./storage/images/Power_bi_bank-payments.png)

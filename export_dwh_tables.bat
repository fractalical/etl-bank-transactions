REM Export customer_dim
bcp "SELECT 'customer_key' AS customer_key, 'first_name' AS first_name, 'last_name' AS last_name, 'contact_no' AS contact_no, 'nid' AS nid UNION ALL SELECT customer_key, first_name, last_name, contact_no, nid FROM group_project_ODS.dbo.ODS_customer_dim" queryout "C:\Users\user\Documents\моё\DSTI\ETL\storage\cleaned_csv_data\customer_dim.csv" -c -t";" -r "\n" -S localhost -T

REM Export store_dim
bcp "SELECT 'store_key' AS store_key, 'division' AS division, 'district' AS district, 'upazila' AS upazila UNION ALL SELECT store_key, division, district, upazila FROM group_project_ODS.dbo.ODS_store_dim" queryout "C:\Users\user\Documents\моё\DSTI\ETL\storage\cleaned_csv_data\store_dim.csv" -c -t";" -r "\n" -S localhost -T

REM Export item_dim
bcp "SELECT 'item_key' AS item_key, 'item_name' AS item_name, 'desc' AS [desc], 'unit_price' AS unit_price, 'man_country' AS man_country, 'supplier' AS supplier, 'unit' AS unit UNION ALL SELECT item_key, item_name, [desc], CAST(unit_price AS VARCHAR(50)), man_country, supplier, unit FROM group_project_ODS.dbo.ODS_item_dim" queryout "C:\Users\user\Documents\моё\DSTI\ETL\storage\cleaned_csv_data\item_dim.csv" -c -t";" -r "\n" -S localhost -T

REM Export trans_dim
bcp "SELECT 'payment_key' AS payment_key, 'trans_type' AS trans_type, 'bank_name' AS bank_name UNION ALL SELECT payment_key, trans_type, bank_name FROM group_project_ODS.dbo.ODS_trans_dim" queryout "C:\Users\user\Documents\моё\DSTI\ETL\storage\cleaned_csv_data\trans_dim.csv" -c -t";" -r "\n" -S localhost -T

REM Export time_dim
bcp "SELECT 'time_key' AS time_key, 'date' AS [date], 'time' AS [time], 'hour' AS hour, 'day' AS day, 'week' AS week, 'month' AS month, 'quarter' AS quarter, 'year' AS year UNION ALL SELECT time_key, CAST([date] AS VARCHAR(10)), CAST([time] AS VARCHAR(8)), CAST(hour AS VARCHAR(3)), CAST(day AS VARCHAR(3)), week, CAST(month AS VARCHAR(3)), quarter, CAST(year AS VARCHAR(4)) FROM group_project_ODS.dbo.ODS_time_dim" queryout "C:\Users\user\Documents\моё\DSTI\ETL\storage\cleaned_csv_data\time_dim.csv" -c -t";" -r "\n" -S localhost -T

REM Export fact_table
bcp "SELECT 'payment_key' AS payment_key, 'customer_key' AS customer_key, 'time_key' AS time_key, 'item_key' AS item_key, 'store_key' AS store_key, 'quantity' AS quantity, 'unit' AS unit, 'unit_price' AS unit_price, 'total_price' AS total_price UNION ALL SELECT payment_key, customer_key, time_key, item_key, store_key, CAST(quantity AS VARCHAR(12)), unit, CAST(unit_price AS VARCHAR(20)), CAST(total_price AS VARCHAR(20)) FROM group_project_ODS.dbo.ODS_fact_table" queryout "C:\Users\user\Documents\моё\DSTI\ETL\storage\cleaned_csv_data\fact_table.csv" -c -t";" -r "\n" -S localhost -T

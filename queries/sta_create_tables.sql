-- Create Store Dimension Table
CREATE TABLE STA_store_dim (
    store_key NVARCHAR(10) PRIMARY KEY,
    division NVARCHAR(50),
    district NVARCHAR(50),
    upazila NVARCHAR(50)
);

-- Create Item Dimension Table
CREATE TABLE STA_item_dim (
    item_key NVARCHAR(10) PRIMARY KEY,
    item_name NVARCHAR(100),
    [desc] NVARCHAR(100),
    unit_price NVARCHAR(50),
    man_country NVARCHAR(50),
    supplier NVARCHAR(100),
    unit NVARCHAR(50)
);

-- Create Customer Dimension Table
CREATE TABLE STA_customer_dim (
    coustomer_key NVARCHAR(10) PRIMARY KEY,
    name NVARCHAR(100),
    contact_no NVARCHAR(50),
    nid NVARCHAR(50)
);

-- Create Transaction Dimension Table
CREATE TABLE STA_trans_dim (
    payment_key NVARCHAR(10) PRIMARY KEY,
    trans_type NVARCHAR(20),
    bank_name NVARCHAR(100)
);

-- Create Time Dimension Table
CREATE TABLE STA_time_dim (
    time_key NVARCHAR(10) PRIMARY KEY,
    date DATETIME,
	hour INT,
    day INT,
	week NVARCHAR(10),
    month INT,
    quarter NVARCHAR(10),
    year INT
);

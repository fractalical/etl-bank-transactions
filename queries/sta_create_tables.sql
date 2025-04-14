-- Create Store Dimension Table
CREATE TABLE STA_store_dim (
    store_key VARCHAR(10) PRIMARY KEY,
    division VARCHAR(50),
    district VARCHAR(50),
    upazila VARCHAR(50)
);

-- Create Item Dimension Table
CREATE TABLE STA_item_dim (
    item_key VARCHAR(10) PRIMARY KEY,
    item_name VARCHAR(100),
    [desc] VARCHAR(100),
    unit_price VARCHAR(50),
    man_country VARCHAR(50),
    supplier VARCHAR(100),
    unit VARCHAR(50)
);

-- Create Customer Dimension Table
CREATE TABLE STA_customer_dim (
    coustomer_key VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    contact_no VARCHAR(50),
    nid VARCHAR(50)
);

-- Create Transaction Dimension Table
CREATE TABLE STA_trans_dim (
    payment_key VARCHAR(10) PRIMARY KEY,
    trans_type VARCHAR(20),
    bank_name VARCHAR(100)
);

-- Create Time Dimension Table
CREATE TABLE STA_time_dim (
    time_key VARCHAR(10) PRIMARY KEY,
    date DATETIME,
	hour INT,
    day INT,
	week VARCHAR(10),
    month INT,
    quarter VARCHAR(10),
    year INT
);

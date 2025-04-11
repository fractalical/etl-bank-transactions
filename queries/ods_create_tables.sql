-- Create Store Dimension Table
CREATE TABLE ODS_store_dim (
    store_key NVARCHAR(10) PRIMARY KEY,
    division NVARCHAR(50) NOT NULL,
    district NVARCHAR(50) NOT NULL,
    upazila NVARCHAR(50) NOT NULL
);

-- Create Item Dimension Table
CREATE TABLE ODS_item_dim (
    item_key NVARCHAR(10) PRIMARY KEY,
    item_name NVARCHAR(100) NOT NULL,
    [desc] NVARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    man_country NVARCHAR(50) NOT NULL,
    supplier NVARCHAR(100) NOT NULL,
    unit NVARCHAR(50) NOT NULL
);

-- Create Customer Dimension Table
CREATE TABLE ODS_customer_dim (
    coustomer_key NVARCHAR(10) PRIMARY KEY,
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    contact_no NVARCHAR(50) NOT NULL,
    nid NVARCHAR(50) NOT NULL
);

-- Create Transaction Dimension Table
CREATE TABLE ODS_trans_dim (
    payment_key NVARCHAR(10) PRIMARY KEY,
    trans_type NVARCHAR(50) NOT NULL,
    bank_name NVARCHAR(100)
);

-- Create Time Dimension Table
CREATE TABLE ODS_time_dim (
    time_key NVARCHAR(10) PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
	hour INT NOT NULL,
    day INT NOT NULL,
	week NVARCHAR(10) NOT NULL,
    month INT NOT NULL,
    quarter NVARCHAR(10) NOT NULL,
    year INT NOT NULL
);


-- Create Fact Table
CREATE TABLE ODS_fact_table (
    fact_key INT IDENTITY(1,1) PRIMARY KEY,
    time_key NVARCHAR(10) NOT NULL,
    store_key NVARCHAR(10) NOT NULL,
    item_key NVARCHAR(10) NOT NULL,
    coustomer_key NVARCHAR(10) NOT NULL,
    payment_key NVARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2) NOT NULL,
    net_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (time_key) REFERENCES ODS_time_dim(time_key),
    FOREIGN KEY (store_key) REFERENCES ODS_store_dim(store_key),
    FOREIGN KEY (item_key) REFERENCES ODS_item_dim(item_key),
    FOREIGN KEY (coustomer_key) REFERENCES ODS_customer_dim(coustomer_key),
    FOREIGN KEY (payment_key) REFERENCES ODS_trans_dim(payment_key)
);


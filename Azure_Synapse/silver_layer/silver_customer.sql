CREATE EXTERNAL TABLE silver_customer
(
    customer_id	varchar(50),
    customer_unique_id varchar(50),
    customer_zip_code_prefix int,
    customer_city varchar(100),
    customer_state char(2)
)
WITH
(
    LOCATION = 'customer/*.parquet',
    DATA_SOURCE = datasource_adls,
    FILE_FORMAT = parquet_format
);

SELECT * from silver_customer;

-- cetas customer

CREATE EXTERNAL TABLE silver_customer2
WITH(
    LOCATION = 'customer',
    DATA_SOURCE = silver_datasource,
    FILE_FORMAT = parquet_format
) AS
SELECT
    customer_id,
    customer_city,
    customer_state 
FROM silver_customer
WHERE customer_city IS NOT NULL
AND customer_state IS NOT NULL;




CREATE EXTERNAL TABLE gold_dim_customer
WITH (
    LOCATION = 'dim_customers',
    DATA_SOURCE = gold_datasource,
    FILE_FORMAT = parquet_format
)
AS
SELECT DISTINCT
    customer_id,
    customer_city,
    customer_state
FROM silver_customer2


SELECT * from gold_dim_customer
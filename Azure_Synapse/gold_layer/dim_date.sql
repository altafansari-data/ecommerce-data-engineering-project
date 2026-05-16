drop EXTERNAL TABLE gold_dim_date
CREATE EXTERNAL TABLE gold_dim_date
WITH (
    LOCATION = 'dim_date',
    DATA_SOURCE = gold_datasource,
    FILE_FORMAT = parquet_format
)
AS
SELECT DISTINCT
    CAST(order_purchase_date AS DATE) AS order_date,
    YEAR(order_purchase_date) AS order_year,
    MONTH(order_purchase_date) AS order_month
FROM silver_order2;

SELECT * from gold_dim_date
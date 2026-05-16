drop EXTERNAL TABLE gold_dim_products
CREATE EXTERNAL TABLE gold_dim_products
WITH (
    LOCATION = 'dim_products',
    DATA_SOURCE = gold_datasource,
    FILE_FORMAT = parquet_format
)
AS
SELECT DISTINCT
    product_id,
    product_category_name,
   product_weight
FROM silver_products2

SELECT * from gold_dim_products
CREATE EXTERNAL TABLE gold_fact_order
WITH (
    LOCATION = 'fact_order',
    DATA_SOURCE = gold_datasource,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    oi.order_id,
    o.customer_id,
    oi.product_id,
    CAST(o.order_purchase_date AS DATE) AS order_date,
    oi.price,
    oi.freight_value
FROM silver_order2 AS o
JOIN silver_order_items2 AS oi
ON o.order_id = oi.order_id;

SELECT * from gold_fact_order;




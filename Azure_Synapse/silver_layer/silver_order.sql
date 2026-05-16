
CREATE EXTERNAL TABLE silver_order
(
    order_id varchar(50),
    customer_id varchar(50),
    order_status varchar(20),
    order_purchase_timestamp datetime,
    order_approved_at datetime,
    order_delivered_carrier_date datetime,
    order_delivered_customer_date datetime,
    order_estimated_delivery_date datetime
	
)WITH(
    LOCATION = 'orders/*.parquet',
    DATA_SOURCE = datasource_adls,
    FILE_FORMAT = parquet_format
);


-- cetas order

CREATE EXTERNAL TABLE silver_order2
WITH(
    LOCATION = 'orders',
    DATA_SOURCE = silver_datasource,
    FILE_FORMAT = parquet_format
) AS
SELECT
    order_id,
    customer_id,
    order_status,
    CAST(order_purchase_timestamp AS DATETIME) AS order_purchase_date
FROM silver_order
WHERE order_status IS NOT NULL;











CREATE EXTERNAL TABLE silver_order_items
(
    order_id varchar(50),
    order_item_id int,
    product_id varchar(50),
    seller_id varchar(50),
    shipping_limit_date datetime,
    price decimal(10, 2),
    freight_value decimal(10, 2)
)
WITH
(
    LOCATION = 'order_items/dbo.order_items.parquet',
    DATA_SOURCE = datasource_adls,
    FILE_FORMAT = parquet_format
);


-- cetas products
drop EXTERNAL TABLE silver_order_items2;
CREATE EXTERNAL TABLE silver_order_items2
WITH(
    LOCATION = 'order_items',
    DATA_SOURCE = silver_datasource,
    FILE_FORMAT = parquet_format
) AS
SELECT
    order_id,
    order_item_id,
    product_id,
    shipping_limit_date,
    price,
    freight_value
FROM silver_order_items
where order_id is not null;







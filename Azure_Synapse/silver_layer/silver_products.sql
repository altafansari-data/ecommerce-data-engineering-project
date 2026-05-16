DROP EXTERNAL TABLE silver_products
CREATE EXTERNAL TABLE silver_products
(
    product_id varchar(50),
    product_category_name varchar(100),
    product_name_lenght smallint,
    product_description_lenght smallint,
    product_photos_qty tinyint,
    product_weight_g int,
    product_length_cm decimal(10, 2),
    product_height_cm decimal(10, 2),
    product_width_cm decimal(10, 2)
)
WITH
(
    LOCATION = 'products/dbo.products.parquet',
    DATA_SOURCE = datasource_adls,
    FILE_FORMAT = parquet_format
);

SELECT * from silver_products



-- cetas products

CREATE EXTERNAL TABLE silver_products2
WITH(
    LOCATION = 'products',
    DATA_SOURCE = silver_datasource,
    FILE_FORMAT = parquet_format
) AS
SELECT
    product_id,
    product_category_name,
    product_weight_g AS product_weight,
    product_length_cm AS product_length,
    product_height_cm AS product_height
FROM silver_products
WHERE product_category_name IS NOT NULL
AND product_weight_g IS NOT NULL
AND product_length_cm IS NOT NULL
AND product_height_cm IS NOT NULL;





-- total sales
CREATE VIEW total_sales
AS
SELECT
    SUM(price) AS total_sales
FROM gold_fact_order;



-- order by state
CREATE VIEW orders_by_state
AS

SELECT
    dc.customer_state,
    COUNT(f.order_id) AS total_orders
FROM gold_fact_order f
JOIN gold_dim_customer dc
ON f.customer_id = dc.customer_id
GROUP BY dc.customer_state
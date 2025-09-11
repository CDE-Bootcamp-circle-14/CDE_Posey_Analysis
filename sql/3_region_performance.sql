--##################################################################
-- Revenue by region per year
--##################################################################
WITH base_data AS (
    SELECT
        EXTRACT(YEAR FROM o.occurred_at) AS year,
        r.name                           AS region,
        o.total_amt_usd                  AS order_value,
        o.id                             AS order_id
    FROM orders o
    JOIN accounts a   ON a.id = o.account_id
    JOIN sales_reps s ON s.id = a.sales_rep_id
    JOIN region r     ON r.id = s.region_id
)
SELECT
    year,
    region,
    SUM(order_value)        AS revenue,
    COUNT(order_id)         AS orders_count,
    AVG(order_value)        AS avg_order_value
FROM base_data
GROUP BY year, region
ORDER BY year, revenue DESC, region;
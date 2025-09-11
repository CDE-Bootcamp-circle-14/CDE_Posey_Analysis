--##################################################################
-- Sales rep performance over years
--##################################################################

WITH base_data AS (
    SELECT
        s.id              AS sales_rep_id,
        s.name            AS sales_rep_name,
        r.name            AS region,
        a.id              AS account_id,
        o.id              AS order_id,
        o.total_amt_usd   AS order_value
    FROM sales_reps s
    JOIN region r        ON r.id = s.region_id
    LEFT JOIN accounts a ON a.sales_rep_id = s.id
    LEFT JOIN orders   o ON o.account_id   = a.id
)
SELECT
    sales_rep_id,
    sales_rep_name,
    region,
    COUNT(DISTINCT account_id)  AS accounts_count,
    COUNT(order_id)             AS orders_count,
    COALESCE(SUM(order_value), 0) AS revenue,
    COALESCE(AVG(order_value), 0) AS avg_order_value
FROM base_data
GROUP BY sales_rep_id, sales_rep_name, region
ORDER BY revenue DESC NULLS LAST,
         orders_count DESC NULLS LAST,
         sales_rep_name;
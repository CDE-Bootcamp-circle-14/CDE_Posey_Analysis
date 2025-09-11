--##################################################################
-- Top 10 accounts 
--##################################################################
SELECT
  a.id                                      AS account_id,
  a.name                                    AS account_name,
  COUNT(o.id)                                AS orders_count,
  COALESCE(SUM(o.total_amt_usd), 0)         AS revenue,
  COALESCE(AVG(o.total_amt_usd), 0)         AS avg_order_value
FROM orders o
JOIN accounts a ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY revenue DESC, orders_count DESC
LIMIT 10;

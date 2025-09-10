-- Sales rep performance over years
SELECT
  s.id                                       AS sales_rep_id,
  s.name                                     AS sales_rep_name,
  r.name                                     AS region,
  COUNT(DISTINCT a.id)                        AS accounts_count,
  COUNT(o.id)                                 AS orders_count,
  COALESCE(SUM(o.total_amt_usd), 0)          AS revenue,
  COALESCE(AVG(o.total_amt_usd), 0)          AS avg_order_value
FROM sales_reps s
JOIN region r     ON r.id = s.region_id
LEFT JOIN accounts a ON a.sales_rep_id = s.id
LEFT JOIN orders   o ON o.account_id   = a.id
GROUP BY s.id, s.name, r.name
ORDER BY revenue DESC NULLS LAST, orders_count DESC NULLS LAST, sales_rep_name;

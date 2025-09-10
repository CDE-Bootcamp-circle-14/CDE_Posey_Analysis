-- Revenue by region per year
SELECT
  DATE_PART('year', o.occurred_at)          AS year,
  r.name                                    AS region,
  COALESCE(SUM(o.total_amt_usd), 0)         AS revenue,
  COUNT(o.id)                                AS orders_count,
  COALESCE(AVG(o.total_amt_usd), 0)         AS avg_order_value
FROM orders o
JOIN accounts a   ON a.id = o.account_id
JOIN sales_reps s ON s.id = a.sales_rep_id
JOIN region r     ON r.id = s.region_id
GROUP BY year, r.name
ORDER BY year, revenue DESC, region;

-- Product performance across the region
SELECT
  r.name                                     AS region,
  COALESCE(SUM(standard_amt_usd), 0)         AS standard_revenue,
  COALESCE(SUM(gloss_amt_usd), 0)            AS gloss_revenue,
  COALESCE(SUM(poster_amt_usd), 0)           AS poster_revenue,
  COALESCE(SUM(total_amt_usd), 0)            AS total_revenue
FROM orders o
JOIN accounts a   ON a.id = o.account_id
JOIN sales_reps s ON s.id = a.sales_rep_id
JOIN region r     ON r.id = s.region_id
GROUP BY r.name
ORDER BY total_revenue DESC, region;

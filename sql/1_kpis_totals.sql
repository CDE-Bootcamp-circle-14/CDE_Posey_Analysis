-- Overall KPIs 2014 - 2017
SELECT
  COUNT(*)                                 AS orders_count,
  COALESCE(SUM(total_amt_usd), 0)          AS revenue,
  COALESCE(AVG(total_amt_usd), 0)          AS avg_order_value
FROM orders;

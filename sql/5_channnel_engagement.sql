-- Web events by channel per year
SELECT
  DATE_PART('year', occurred_at)             AS year,
  channel,
  COUNT(*)                                   AS events_count
FROM web_events
GROUP BY year, channel
ORDER BY year, events_count DESC, channel;

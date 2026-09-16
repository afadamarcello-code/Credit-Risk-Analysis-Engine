SELECT 
  v.key AS column_name,
  COUNT(*) FILTER (WHERE v.value IS NULL) AS missing_count,
  ROUND(100.0 * COUNT(*) FILTER (WHERE v.value IS NULL) / COUNT(*), 2) AS percent_missing
FROM credit_risk_raw t,
LATERAL jsonb_each_text(to_jsonb(t)) v
GROUP BY v.key
ORDER BY missing_count DESC;



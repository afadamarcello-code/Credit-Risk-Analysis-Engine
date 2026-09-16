SELECT 
  v.key AS column_name,
  COUNT(*) FILTER (WHERE v.value IS NULL) AS missing_count,
  ROUND(100.0 * COUNT(*) FILTER (WHERE v.value IS NULL) / COUNT(*), 2) AS percent_missing
FROM credit_risk_raw t,
LATERAL jsonb_each_text(to_jsonb(t)) v
GROUP BY v.key
ORDER BY missing_count DESC;


SELECT 
		MAX(person_age) AS OLDEST_PERSON,
	    MAX(person_income) AS MAXIMUM_INCOME,
		min(person_age) AS youngest,
		min(person_income) AS lowest,
		max(person_emp_length) as max_emp_length,
		min(person_emp_length) as min_emp_length
		FROM credit_risk_raw;


SELECT 
	COUNT(*),
	loan_status,
	round (100.0*count(*)/sum(count(*)) over(),2) as percentage
FROM credit_risk_raw
GROUP BY loan_status;


SELECT 
    -- Interest Rate Statistics
    AVG(loan_int_rate) AS mean_loan_int_rate,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY loan_int_rate) AS median_loan_int_rate,

    -- Employment Length Statistics
    AVG(person_emp_length) AS mean_emp_length,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY person_emp_length) AS median_emp_length  -- Removed trailing comma here

FROM credit_risk_raw;

-- 1. Fill the missing Interest Rates with the Median (11.0)
UPDATE credit_risk_raw
SET loan_int_rate = 11.0
WHERE loan_int_rate IS NULL;
-- 2. Fill the missing Employment Lengths with the Median (4.0)
UPDATE credit_risk_raw
SET person_emp_length = 4.0
WHERE person_emp_length IS NULL;

-- 3. Fix the Superman Outliers! (Capping them)
-- Cap the 144-year-old to 80
UPDATE credit_risk_raw
SET person_age = 80
WHERE person_age > 80;

-- Cap the 123-year employee to 60!
UPDATE credit_risk_raw
SET person_emp_length = 60
WHERE person_emp_length > 60;




-- Create a View so the data is neatly packaged for Python
CREATE VIEW vw_credit_data AS
SELECT 
    person_age, age_band, person_income, income_band,
    person_home_ownership, person_emp_length, employment_category,
    loan_intent, loan_grade, loan_amnt, loan_int_rate, loan_status,
    loan_percent_income, loan_to_income_pct,
    cb_person_default_on_file, cb_person_cred_hist_length,
    exposure_at_default, loss_given_default
FROM credit_risk_raw;

-- Export the View to a new CSV file for Python
COPY (SELECT * FROM vw_credit_data) 
TO 'D:\projects\risk\cleaned_credit_data.csv' 
DELIMITER ',' 
CSV HEADER;
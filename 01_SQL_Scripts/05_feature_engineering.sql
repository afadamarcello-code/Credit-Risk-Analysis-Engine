-- 1. Add a new column for Employment Category
ALTER TABLE credit_risk_raw ADD COLUMN employment_category VARCHAR(20);
UPDATE credit_risk_raw
SET employment_category = CASE
    WHEN person_emp_length <= 2 THEN 'New_Employee'
    WHEN person_emp_length <= 5 THEN 'Junior_Employee'
    WHEN person_emp_length <= 10 THEN 'Mid_Employee'
    ELSE 'Senior_Employee'
END;

-- 2. Add a new column for Age Bands
ALTER TABLE credit_risk_raw ADD COLUMN  age_band VARCHAR(20);
UPDATE credit_risk_raw
SET age_band= CASE 
				WHEN person_age < 25 THEN 'Young_Adult'
   			    WHEN person_age BETWEEN 25 AND 40 THEN 'Adult'
   			    WHEN person_age BETWEEN 41 AND 60 THEN 'Middle_Age'
   			    ELSE 'Senior' END;

-- 3. Add a new column for Income Bands
ALTER TABLE credit_risk_raw
ADD COLUMN income_band VARCHAR(20);
UPDATE credit_risk_raw
SET income_band = CASE
				WHEN person_income < 30000 THEN 'Low_Income'
    			WHEN person_income BETWEEN 30000 AND 70000 THEN 'Medium_Income'
    			WHEN person_income BETWEEN 70001 AND 150000 THEN 'High_Income'
    			ELSE 'Very_High_Income' END;


-- 1: Loan-to-Income Ratio 
-- We multiply by 100 to get a percentage. E.g., Loan 10k, Income 50k = 20%
ALTER TABLE credit_risk_raw ADD COLUMN loan_to_income_pct NUMERIC;

UPDATE credit_risk_raw
SET loan_to_income_pct = ROUND((loan_amnt::NUMERIC / person_income) * 100, 2);

-- 2: Expected Loss Math (Baking it into the data!)
-- EAD (Exposure at Default) = The Loan Amount (How much the bank loses if the person defaults immediately)
ALTER TABLE credit_risk_raw ADD COLUMN exposure_at_default NUMERIC;
UPDATE credit_risk_raw SET exposure_at_default = loan_amnt;

-- LGD (Loss Given Default) = Standard assumption is 60% loss.
ALTER TABLE credit_risk_raw ADD COLUMN loss_given_default NUMERIC;
UPDATE credit_risk_raw SET loss_given_default = 0.60;

				   
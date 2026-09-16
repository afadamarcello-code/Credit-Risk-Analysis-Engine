import streamlit as st
import pandas as pd
import joblib
import json

# 1. Load the AI Brain and the Columns
xgb = joblib.load('xgb_credit_model.pkl')
with open('model_columns.json', 'r') as f:
    model_columns = json.load(f)

# 2. Set up the Web App Design
st.set_page_config(page_title="Credit Risk AI", page_icon="🏦")
st.title("🏦 Credit Risk AI Engine")
st.markdown("Enter the applicant's details below to predict their **Probability of Default (PD)**.")

# 3. Create the User Input Form (Sliders and Dropdowns)
col1, col2 = st.columns(2)

with col1:
    age = st.slider("Person Age", 20, 80, 30)
    income = st.number_input("Annual Income ($)", min_value=4000, max_value=6000000, value=50000)
    loan_amnt = st.number_input("Loan Amount Requested ($)", min_value=500, max_value=35000, value=10000)
    int_rate = st.slider("Interest Rate (%)", 5.0, 25.0, 12.0)

with col2:
    home_ownership = st.selectbox("Home Ownership", ["RENT", "OWN", "MORTGAGE", "OTHER"])
    loan_intent = st.selectbox("Loan Intent", ["EDUCATION", "MEDICAL", "PERSONAL", "VENTURE", "DEBTCONSOLIDATION", "HOMEIMPROVEMENT"])
    loan_grade = st.selectbox("Loan Grade", ["A", "B", "C", "D", "E", "F", "G"])
    default_on_file = st.selectbox("Previous Default on File?", ["N", "Y"])

# 4. The Prediction Button
if st.button("Predict Default Risk 🎯"):
    # Create a DataFrame from the user inputs
    input_data = pd.DataFrame({
        'person_age': [age],
        'person_income': [income],
        'person_home_ownership': [home_ownership],
        'person_emp_length': [4.0], # Assuming median
        'loan_intent': [loan_intent],
        'loan_grade': [loan_grade],
        'loan_amnt': [loan_amnt],
        'loan_int_rate': [int_rate],
        'loan_percent_income': [loan_amnt / income],
        'cb_person_default_on_file': [default_on_file],
        'cb_person_cred_hist_length': [3] # Assuming median
    })
    
    # Add the engineered feature
    input_data['loan_to_income_pct'] = (input_data['loan_amnt'] / input_data['person_income']) * 100

    # One-Hot Encode the input (The Translator)
    input_encoded = pd.get_dummies(input_data, drop_first=True)

    # Ensure the input has the exact same 23 columns as the AI brain expects
    input_encoded = input_encoded.reindex(columns=model_columns, fill_value=0)

    # 5. Make the Prediction!
    probability = xgb.predict_proba(input_encoded)[0][1] * 100

    # 6. Show the Result!
    st.subheader("📊 AI Risk Assessment:")
    if probability > 50:
        st.error(f"⚠️ HIGH RISK! The AI predicts a {probability:.2f}% chance of default.")
    else:
        st.success(f"✅ LOW RISK! The AI predicts a {probability:.2f}% chance of default.")
    
    st.progress(float(probability) / 100)
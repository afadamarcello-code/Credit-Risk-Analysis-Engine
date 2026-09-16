# 🏦 Credit Risk Analysis & Expected Loss Prediction Engine

[![Streamlit App](https://img.shields.io/badge/Streamlit-Live_Web_App-FF4B4B?style=for-the-badge&logo=streamlit&logoColor=white)](https://share.streamlit.io/)
[![Power BI Dashboard](https://img.shields.io/badge/Power_BI-Interactive_Report-F2C94C?style=for-the-badge&logo=powerbi&logoColor=black)](#-dashboard-preview)

## 📌 Project Overview
This project models an enterprise-level Credit Risk & Expected Loss Prediction pipeline. It transforms raw loan applicant data using PostgreSQL, trains a machine learning classification engine (XGBoost) to predict Probability of Default (PD), calculates total Expected Loss (EL), and deploys the solution via an interactive Power BI executive dashboard and a live Streamlit web application.

The goal is to provide commercial banks and credit analysts with real-time risk scoring, automated applicant decisioning, and dynamic stress-testing capabilities.

---

## 🗂️ Project Repository Structure

```text
credit-risk-expected-loss-engine/
│
├── data/                             # Raw & processed financial datasets
│   ├── raw_loan_data.csv
│   ├── cleaned_loan_data.csv
│   └── predicted_risk_scores.csv     # Model output with PD predictions
│
├── sql_scripts/                      # PostgreSQL Cleaning & Feature Engineering
│   ├── 01_data_cleaning.sql
│   ├── 02_outlier_capping.sql
│   └── 03_feature_engineering.sql
│
├── python/                           # Machine Learning & Pipeline Scripts
│   ├── 01_data_preprocessing.py
│   ├── 02_train_xgboost_model.py
│   └── app.py                        # Streamlit Web Application
│
├── docs/                             # Documentation & Visual Assets
│   └── screenshots/
│       └── powerbi.png
│
├── Risk_Analysis_Dashboard.pbix      # Interactive Power BI Dashboard
└── README.md                         # Project Documentation
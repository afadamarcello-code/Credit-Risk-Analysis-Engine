🏦 Credit Risk Analysis & Expected Loss Prediction Engine
📌 Project Overview
An end-to-end Data Science and Machine Learning project that predicts the Probability of Default (PD) for loan applicants, calculates the bank's Expected Loss (EL), and deploys the model as a live web application.

🛠️ Tech Stack
Database: PostgreSQL / pgAdmin (Data Cleaning & Feature Engineering)
Machine Learning: Python, Pandas, Scikit-Learn, XGBoost
Business Intelligence: Power BI, DAX (Dynamic What-If Parameters)
Deployment: Streamlit (Web App)
🧠 The Math (The Expected Loss Formula)
The core business logic revolves around the standard banking formula:Expected Loss (EL) = Exposure at Default (EAD) × Probability of Default (PD) × Loss Given Default (LGD)

🚀 Key Features & Upgrades
SQL Feature Engineering: Handled missing values, capped outliers (e.g., 144-year-olds), and engineered loan_to_income_pct.
Prevented Data Leakage: Dropped post-outcome variables (EAD, LGD) before training the ML model to ensure real-world viability.
XGBoost AI Brain: Achieved 92.5% Accuracy and 78% Recall on defaults using scale_pos_weight to handle imbalanced data.
Dynamic Power BI Dashboard: Built a "What-If" parameter slider allowing users to adjust the Loss Given Default (LGD) assumption and watch the Expected Loss recalculate instantly. Includes a Risk Heatmap and Danger Zone Scatter Plot.
Live Web App: Deployed the model using Streamlit so bank tellers can input applicant details and get an instant risk score.
📊 Dashboard Preview

![Dashboard Preview](D:\projects\risk\03_PowerBI_Dashboard\powerbi.png)
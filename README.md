# 📱 Telecom Customer Churn Analysis
### Python • MySQL • Power BI • Machine Learning

---

## 📌 Problem Statement
A telecom company was losing customers with a 26% churn rate
costing thousands in monthly revenue. This project identifies
key churn drivers, scores customers by risk level and provides
actionable retention recommendations.

---

## 🛠️ Tools Used
| Tool | Purpose |
|---|---|
| Python (Pandas, Scikit-learn) | Data Cleaning, EDA & ML Model |
| MySQL | Business SQL Queries |
| Logistic Regression | Churn Risk Scoring |
| Power BI | Interactive Dashboard |

---

## 📁 Project Structure
telecom-churn-analysis/

├── data/

│   ├── telco_churn.csv

│   └── churn_cleaned.csv

├── notebooks/

│   ├── 01_data_cleaning.ipynb

│   └── 02_churn_model.ipynb

├── sql/

│   └── churn_analysis.sql

├── dashboard/

│   └── churn_dashboard.pbix

├── outputs/

│   ├── 02_churn_distribution.png

│   ├── 02_churn_by_contract.png

│   ├── 02_charges_vs_churn.png


│   └── churn_risk_scores.csv

└── README.md

---
## 📊 Key Business Insights
1. 26.54% overall churn rate — 1,869 customers lost monthly
2. $139.13K monthly revenue at risk from churning customers
3. Month-to-month contracts show highest churn rate by far
4. Fiber Optic customers churn significantly more than DSL
5. 373 high risk customers identified with $27,977 charges at risk
6. New customers (0-12 months) are most likely to churn
7. Electronic check payment users have highest churn rate
8. Senior citizens account for 63.84% of total churn
9. Avg churned customer tenure is only 17.98 months
---

## 🤖 Model Performance
| Metric | Score |
|---|---|
| Algorithm | Logistic Regression |
| Accuracy | ~80% |
| ROC-AUC | ~0.78 |

---

## 📈 Dashboard Preview
![Churn Overview](outputs/02_churn_distribution.png)
![Contract Analysis](outputs/02_churn_by_contract.png)
![Charges vs Churn](outputs/02_charges_vs_churn.png)

---

## 🚀 How to Run

1. Clone the repo
```bash
git clone https://github.com/surajsalokhe19/telecom-churn-analysis.git
```

2. Install libraries
```bash
pip install pandas matplotlib seaborn scikit-learn
```

3. Run notebooks in order
01_data_cleaning.ipynb

02_churn_model.ipynb

4. Open dashboard
dashboard/churn_dashboard.pbix

---

## 💡 Business Recommendations
1. Offer 10-15% discount to convert month-to-month to annual contracts
2. Launch New Customer Onboarding Program for first 12 months
3. Review Fiber Optic pricing — highest churn among internet services
4. Incentivize auto-payment — eliminate electronic check friction
5. Create dedicated Senior Citizen retention plan
6. Immediately contact 373 high risk customers with retention offers
7. Introduce loyalty pricing — lower rates for longer tenure customers

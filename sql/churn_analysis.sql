CREATE DATABASE telecom_db;
USE telecom_db;

SELECT * FROM churn_cleaned LIMIT 5;

SELECT COUNT(*) FROM churn_cleaned;


-- Business Overview
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)  / COUNT(*) * 100, 2) AS Churn_Rate,
        
    ROUND(SUM(MonthlyCharges), 2) AS Total_Monthly_Revenue,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' 
        THEN MonthlyCharges ELSE 0 END), 2) AS Revenue_At_Risk
        
FROM churn_cleaned; -- What this tells us: Overall churn picture and revenue at risk.



-- Churn by Contract Type
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Churn_Rate
        
FROM churn_cleaned
GROUP BY Contract
ORDER BY Churn_Rate DESC; -- What this tells us: Month-to-month contracts have highest churn.



-- Churn by Internet Service
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Churn_Rate
FROM churn_cleaned
GROUP BY InternetService
ORDER BY Churn_Rate DESC; -- What this tells us: Which internet service loses most customers.



-- Churn by Payment Method
SELECT
    PaymentMethod,
    COUNT(*)  AS Total_Customers,
    
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Churn_Rate
FROM churn_cleaned
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC; -- What this tells us: Electronic check users churn the most.


-- Revenue at Risk by Contract
SELECT
    Contract,
    ROUND(SUM(CASE WHEN Churn = 'Yes'
        THEN MonthlyCharges ELSE 0 END), 2) AS Revenue_At_Risk,
        
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers
FROM churn_cleaned
GROUP BY Contract
ORDER BY Revenue_At_Risk DESC; -- What this tells us: How much money is at risk per contract type.


-- Churn by Tenure Band (Window Function)
SELECT
    `Tenure Band`, COUNT(*) AS Total_Customers,
    
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Churn_Rate,
    RANK() OVER (ORDER BY 
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 DESC) AS Churn_Rank
FROM churn_cleaned
GROUP BY `Tenure Band`
ORDER BY Churn_Rate DESC; -- What this tells us: New customers (0-12 months) churn the most.




-- High Risk Customers (CTE)
-- CTE finds customers most likely to churn
-- Month to month contract + high charges + low tenure
WITH High_Risk AS (
    SELECT *
    FROM churn_cleaned
    WHERE Contract = 'Month-to-month'
    AND MonthlyCharges > 65
    AND tenure < 12
)
SELECT
    COUNT(*)  AS High_Risk_Customers,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Churn_Rate,
    
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END), 2) AS Revenue_At_Risk
    
	FROM High_Risk; -- What this tells us: Exact high risk segment — most important query!


--  Average Charges Churned vs Retained
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charges,
    ROUND(AVG(TotalCharges), 2)   AS Avg_Total_Charges,
    ROUND(AVG(tenure), 1)         AS Avg_Tenure_Months
FROM churn_cleaned
GROUP BY Churn; -- What this tells us: Churned customers pay more but stay less.








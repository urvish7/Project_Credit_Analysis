------------ Calling the tables through the commands ---------

Select * From Account
Select * From Credit_Info
Select * From Customers
Select * From Loan
Select * From Project_test
Select * From Project_train
SELECT * From Income_Liabilities






Drop TABLE project_train;
CREATE TABLE project_train(
ID INT,
Customer_ID INT,
Month INT,
Name VARCHAR,
Age INT,
SSN float,
Occupation VARCHAR,
Annual_Income FLOAT,
Monthly_Inhand_Salary FLOAT,
Num_Bank_Accounts INT,
Num_Credit_Card INT,
Interest_Rate INT,
Num_of_Loan INT,
Type_of_Loan VARCHAR,
Delay_from_due_date INT,
Num_of_Delayed_Payment FLOAT,
Changed_Credit_Limit FLOAT,
Num_Credit_Inquiries FLOAT,
Credit_Mix VARCHAR,
Outstanding_Debt FLOAT,
Credit_Utilization_Ratio FLOAT,
Credit_History_Age FLOAT,
Payment_of_Min_Amount VARCHAR,
Total_EMI_per_month FLOAT,
Amount_invested_monthly FLOAT,
Payment_Behaviour VARCHAR,
Monthly_Balance FLOAT,
Credit_Score VARCHAR
 );


--------------------------------------    Creating the table project_test --------------------------------------
Drop TABLE project_test;
CREATE TABLE project_test(
ID INT,
Customer_ID INT,
Month INT,
Name VARCHAR,
Age INT,
SSN float,
Occupation VARCHAR,
Annual_Income FLOAT,
Monthly_Inhand_Salary FLOAT,
Num_Bank_Accounts INT,
Num_Credit_Card INT,
Interest_Rate INT,
Num_of_Loan INT,
Type_of_Loan VARCHAR,
Delay_from_due_date INT,
Num_of_Delayed_Payment FLOAT,
Changed_Credit_Limit FLOAT,
Num_Credit_Inquiries FLOAT,
Credit_Mix VARCHAR,
Outstanding_Debt FLOAT,
Credit_Utilization_Ratio FLOAT,
Credit_History_Age FLOAT,
Payment_of_Min_Amount VARCHAR,
Total_EMI_per_month FLOAT,
Amount_invested_monthly FLOAT,
Payment_Behaviour VARCHAR,
Monthly_Balance FLOAT
 );

 ------------------------------------------Creating the Customers table--------------------------------------------
 
SELECT ID, Customer_id,Name,Age,SSN,Occupation,Num_Bank_Accounts,Num_Credit_Card
INTO Customers
FROM project_train;

-------------------------------------Creating the Account table ----------------------------------------------

SELECT Customer_ID,Annual_Income, Monthly_Inhand_Salary,Monthly_Balance,Amount_invested_monthly,Total_EMI_per_month,Payment_of_Min_Amount
INTO Account
FROM project_train;

----------------------------------- Creating the Loan table ----------------------

SELECT Customer_ID,Num_of_Loan,Type_of_Loan,Interest_Rate,Delay_from_due_date,Num_of_Delayed_Payment,Payment_of_Min_Amount,Total_EMI_per_month,Amount_invested_monthly
INTO Loan
FROM project_train;


-----------------------------------------Creating the Credit Info table-----------------------

SELECT Customer_ID,Num_Credit_Card,Changed_Credit_Limit,Num_Credit_Inquiries,Credit_Mix,Outstanding_Debt,Credit_Utilization_Ratio,Credit_History_Age,Payment_of_Min_Amount,Payment_Behaviour
INTO Credit_Info
FROM project_train;

------------------------------Creating the JOIN table query -----------------------

SELECT
Account.Customer_ID AS Customer_ID,
Account.Annual_Income AS Annual_Income,
Account.Monthly_Inhand_Salary AS Monthly_Inhand_Salary,
Account.Monthly_Balance AS Monthly_Balance,
Account.Amount_invested_monthly AS Amount_invested_monthly,
Account.Total_EMI_per_month AS Total_EMI_per_month,
loan.Num_of_Loan AS Num_of_Loan,
loan.Interest_Rate AS Interest_Rate,
loan.Delay_from_due_date AS Delay_from_due_date,
loan.Num_of_Delayed_Payment AS Num_of_Delayed_Payment,
loan.Payment_of_Min_Amount AS Payment_of_Min_Amount
INTO Income_Liabilities
FROM Account
FULL OUTER JOIN loan ON
Account.Customer_ID=loan.Customer_ID
ORDER BY Account.Annual_Income;


--------------------------END of Code------------------------------------------
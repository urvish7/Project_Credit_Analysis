# Credit Score Analysis

## Data
- Credit score data set with 28 columns was sourced from kaggle.
- Data is divided further into smaller sets inorder to accomplish better results.
- Using this metadata we will generate our hypothesis and by using that we will acieve our conclusions. 

## Proposed findings and a hypothesis of results
Credit scores are a universal metric, used by companies and individuals alike, in various areas of life to make decisions. With this dataset, we hope to perform a deep learning classification analysis of the data to determine whether we can predict if an individual will have a good or bad credit score based on the input features provided.

A credit score can considerably influence your economic existence. It plays a key function in a lender's decision to offer you credit. People accompanying credit scores beneath 640, e.g., are mainly deliberate expected subprime borrowers. Lending organizations frequently charge interest on subprime mortgages at a rate above a unoriginal mortgage to offset themselves from bearing more risk. They grant permissions like demanding a smaller compensation term or a co-signer for borrowers accompanying a low credit score


## The Raw Data: 

![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Presentation/PNG%20file/Description_of_Data.jpg)


## The Technology Used:

![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Presentation/PNG%20file/Technology_Used.jpg)

## The Affecting Factors:

![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Presentation/PNG%20file/Factors_that_affects.jpg)

## The Initial Flow of the Project:

![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Presentation/PNG%20file/The_Initial_Flow.jpg)

# Tableau Visualization 

 From the current Dataset we have generated some visualizations which leads to better understanding of the data. 
 
 [Tableau Visualization](https://public.tableau.com/views/Credit_Analysis_16590381137970/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)
 
 
 ### Payment History in Terms of the Age and Annual Income:
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/Payment%20History.png)
 
 ### Credit Utilization vs. Outstanding Debt:
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/Credit_Utilization.png)
 
 ### Number of Credit Inquiries vs. Change Credit Limit.
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/Credit_Utilization.png)
 
 ### Annual Income vs. Outstanding Debt.
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/AnnInc-Debt.png)
 
 ### Number of  Loans vs. Annual Income 
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/NoofLoans.jpg)
 
 ### Income vs. outstanding debt.
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/Income-OustandingDebt.png)
 
 ### The Credit Mix Impacting Factors.
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/Credit_Mix.png)
 
 ### The EMI per Month vs. Delay per Month. 
 
 ![](https://github.com/NKKhosa/group_14_project/blob/urvish_segment3/Resources/Tableau/Total_EMI.png)
 
 

## Machine Learning Model
### Initail Neural Net Model
As also visualized in the Data_pipeline.png flowchart in the Resourcecs/ folder, we initially created a supervised deep learning model to classify the individuals in into 3 groups: 
- Good credit, 
- Standard credit, and
- Bad credit

However, this model did not prodce favorable results, and nor did the model run on a reduced binary classification. This is likely due to the high level of null values in the data set which once removed, resulted in a significantly smaller training set. This caused the neural net to overfit and perform poorly on the testing set.

### Tree-Based Models
Tree based models performed the best on this data set with higher accuracy. RandomTreeClassifier, XGBoost Classifier and LightGBM Classifier were used. LightGBM showed the best results.

### Data Preprocessing
Data was preprocessed using Python in Jupyter Notebook.
ID columns (Name, ID, Customer ID, SSN) and null values were dropped.
Columns with string data types were encoded using OneHotEncoder.
Prior to encoding columns with >10 unique values were binned.
Occupation column was left at 15 equally distributed unique values.
Data was then split into features and target
The first set had 3 targets:
- Good credit score
- Standard credit score
- Poor credit score
The second set had 1 target column which had 2 possible values:
- Good credit score
- Poor credit score

### Feature Engineering
During exploratory analysis a relationship between the Outstanding Debt and Annual Income columns was shown to indicate credit score quality on some level.
A new column was created and added to the DataFrame by dividing the Outstanding_Debt column by the Annual_Income column and setting this ratio as the value.

### Feature Selection
The identification columns were left out of feature selection as they do not provide any analytical power.

#### Input Features
- Month 
- Age 
- Occupation 
- Annual_Income
- Monthly_InHand_Salary
- Num_Bank_Accounts
- Num_Credit_Card
- Interest_Rate
- Num_Loan
- Delay_from_due_date
- Num_of_Delayed_Payment
- Changed_Credit_Limit
- Num_Credit_Inquiries
- Credit_Mix
- Outstanding_Debt
- Credit_Utilization_Ratio
- Credit_History_Age
- Payment_of_Min_Amount
- Total_EMI_per_month
- Amount_invested_monthly 
- Payment_Behaviour
- Monthly_Balance

* The Type_of_Loan column was removed because the majority of its values were 'No Data' or 'Not Specified' and 'Other'. It was decided that this column was not informative.

#### Output 
- Credit_Score

### Training and Testing
Prior to scaling, the data was split into features and target, then train_test_split was used from the sklearn library to split the features and target into a training and testing set, which was stratified.

### Model Choice 
- RandomForest
  - Started with a random forest model for the categorical output
  - Only had an accuracy score of 0.695
  - Presumably due to the three categorical outputs this model was insufficient
  - Ran relatively quickly
- Neural Net
  - Moved on to a NN model 
  - 3 layers, ReLU activation on inner layers, Softmax activation on output layer
  - Categorical crossentropy loss metric, adam optimizer, and accuracy score used
  - Trained over 75 epochs to try and reduce overfitting
  - Loss: 0.82, accuracy: 0.65
  - Presumably due to the reduced training data size (3 possible outputs vs. 2) the data is overfitting to the training set
  - Took a long time to run

We decided to collapse the ‘Standard’ category for Credit_Score into the ‘Good’ category to increase the training data. 
- RandomForest
  - Started with a RandomForest model for the binary output
  - Only had an accuracy score of 0.83
  - Produced a good classification model
  - Ran relatively quickly
- Neural Net
  - Tried to run a NN model to see if accuracy could be increased
  - 3 layers, ReLU activation on inner layers, Sigmoid activation on output layer
  - Binary crossentropy loss metric, adam optimizer, and accuracy score used
  - Trained over 100 epochs
  - Loss: 0.56,  accuracy: 0.77
  - Did not perform as well as the RandomForest model, likely due to overfitting  
  - Took a long time to run

Next, more tree-based models were tried as the RandomForest Classifier had the highest accuracy so far.
- XgBoost
  - 58.3% accuracy for the multi-class output
  - 94.7% accuracy for the binary classification

- LightGBM
  - Training accuracy: 73.8 %
  - Testing accuracy: 71.7%
  - Feature Importance:
    - ![](https://github.com/NKKhosa/group_14_project/blob/main/Resources/lgbm_feature_importance.png)
    - Top 5 Features were:
      - Interest_Rate
      - Outstanding_Debt
      - Total_EMI_per_Month
      - Credit_History_Age
      - Changed_Credit_Limit
  - Loss
    - ![](https://github.com/NKKhosa/group_14_project/blob/main/Resources/lgbm_logloss_metric.png)
  - Confusion Matrix
    - ![](https://github.com/NKKhosa/group_14_project/blob/main/Resources/lgbm_confusion_matrix_table.png)
    - ![](https://github.com/NKKhosa/group_14_project/blob/main/Resources/lgbm_confusion_matrix_visual.png)
    
    
### Please check out our presentation on : [Credit Analysis PPT](https://docs.google.com/presentation/d/1rO1Qn5uUvHPm8TPr4-q_1kWlEu3WcnBhsWgwHcXXBaw/edit#slide=id.g14365d3e329_1_24)
      




### By [Urvish Desai](https://github.com/urvish7) and [Neeshma Khosa](https://github.com/NKKhosa)

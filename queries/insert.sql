LOAD DATA INFILE '"C:\Users\keshi\OneDrive\Documents\DB_Design\BankManagementSystem\SourceData\Account_Data.csv'
INTO TABLE account
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '"C:\Users\keshi\OneDrive\Documents\DB_Design\BankManagementSystem\SourceData\ATM_Details.csv'
INTO TABLE atm_Details
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '"C:\Users\keshi\OneDrive\Documents\DB_Design\BankManagementSystem\SourceData\Branch_Details.csv'
INTO TABLE Bank
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '"C:\Users\keshi\OneDrive\Documents\DB_Design\BankManagementSystem\SourceData\Customer_Data.csv'
INTO TABLE customer
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '"C:\Users\keshi\OneDrive\Documents\DB_Design\BankManagementSystem\SourceData\Doc_Verification.csv'
INTO TABLE doc_verification
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '"C:\Users\keshi\OneDrive\Documents\DB_Design\BankManagementSystem\SourceData\Transactions_Data.csv'
INTO TABLE transaction
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE '"C:\Users\keshi\OneDrive\Documents\DB_Design\BankManagementSystem\SourceData\Loan_Details.csv'
INTO TABLE loan
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

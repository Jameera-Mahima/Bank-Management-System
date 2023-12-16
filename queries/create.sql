-- create database bank;
use bank;

CREATE TABLE IF NOT EXISTS bank
(
    BranchName varchar(30),
    BranchID varchar(30) NOT NULL,
    RoutingNumber numeric,
    Address varchar(100),
	PRIMARY KEY (BranchID)
);

CREATE TABLE IF NOT EXISTS customer
(
    customerid integer NOT NULL,
    firstname varchar(30),
    lastname varchar(30),
    gender varchar(10),
    age integer,
    tenure integer,
    noofproducts integer,
    is_verified char(1),
    branch varchar(30),
    address varchar(100),
    creditscore integer,
    customer_status varchar(10),
    PRIMARY KEY (customerid),
    FOREIGN KEY (branch) REFERENCES bank (BranchID)
);



CREATE TABLE IF NOT EXISTS account
(
    accountid integer NOT NULL,
    currency varchar(4),
    customerid integer ,
    working_bal integer,
    category varchar(20),
    branchid varchar(30),
    account_status varchar(10),
    PRIMARY KEY (accountid),
	FOREIGN KEY (branchid) REFERENCES bank (BranchID),
	FOREIGN KEY (customerid) REFERENCES customer (customerid)
);


CREATE TABLE IF NOT EXISTS doc_verification
(
    customerid integer NOT NULL,
    address varchar(30),
    verification_status varchar(30),
    validation_status varchar(30),
    comments varchar(200),
	PRIMARY KEY (customerid),
    FOREIGN KEY (customerid) REFERENCES customer (customerid)
);

CREATE TABLE IF NOT EXISTS transaction
(
    transactionref varchar(20) NOT NULL,
    debit_account integer,
    amount_debited integer,
    credit_account integer,
    amount_credited integer,
    transaction_date timestamp,
    PRIMARY KEY (transactionref),
    FOREIGN KEY (credit_account) REFERENCES account (accountid),
    FOREIGN KEY (debit_account) REFERENCES account (accountid)
);


CREATE TABLE IF NOT EXISTS atm_Details
(
    atm_name varchar(40),
    transactiondate date,
    noofwithdrawals integer,
    totalamtwithdrawn integer,
    weekday varchar(30),
    workingday character(1),
    branchid varchar(30),
    PRIMARY KEY (atm_name, transactiondate),
    FOREIGN KEY (branchid)
        REFERENCES bank (BranchID) -- Adjust according to the actual column name in the bank table
);



CREATE TABLE IF NOT EXISTS loan
(
    loanid integer NOT NULL,
    accountid integer,
    loan_amount numeric,
    funded_amount numeric,
    term varchar(30),
    int_rate varchar(20),
    installment numeric,
    home_ownership varchar(30),
    annual_inc numeric,
    verification_status varchar(20),
    issue_date date,
    loan_status varchar(20),
    PRIMARY KEY (loanid),
    FOREIGN KEY (accountid)
    REFERENCES account (accountid) 
);

select * from doc_verification;
select * from transaction;
drop table transaction;

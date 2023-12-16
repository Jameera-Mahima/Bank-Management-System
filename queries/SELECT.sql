SELECT gender, COUNT(*) AS count
FROM customer AS c
WHERE c.customerid IN (
    SELECT customerid
    FROM account AS a
    WHERE a.accountid IN (
        SELECT accountid
        FROM loan AS l))
GROUP BY gender
ORDER BY count DESC;


SELECT customerid FROM customer WHERE creditscore > 800 AND customerid IN
(
    SELECT accountid FROM account WHERE accountid IN
    (
        SELECT accountid FROM loan WHERE loan_status != 'Charged Off'
    )
);

SELECT customer.customerid, count(*) as no_of_accounts
FROM customer
INNER JOIN account
ON customer.customerid = account.customerid
GROUP BY customer.customerid
HAVING count(*) > 2
ORDER BY no_of_accounts desc;
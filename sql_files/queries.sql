SELECT customerID, firstName, lastName FROM customer
WHERE customerID IN (SELECT customerID FROM borrowed WHERE returnStatus = 'NOT RETURNED');

SELECT cs.customerID, cs.branchID, borrowed.payFine FROM customer_subscription cs, borrowed
WHERE
borrowed.payFine IS NOT NULL
AND
cs.customerID = borrowed.customerID;

SELECT branchID, COUNT(customerID) AS numberOfCustomers FROM customer_subscription
GROUP BY branchID
ORDER BY numberOfCustomers DESC;

SELECT b.branchName AS nameOfBranch, COUNT(cs.customerID) AS numberOfCustomers
FROM customer_subscription cs, branch b
WHERE cs.branchID = b.branchID
GROUP BY nameOfBranch
ORDER BY numberOfCustomers DESC;

SELECT br.customerID, c.firstName, c.lastName, SUM(br.payFine) AS totalFine, b.branchName AS payHere
FROM borrowed br, customer c, branch b
WHERE
br.payFine IS NOT NULL
AND
br.customerID = c.customerID
AND
b.branchName IN (SELECT branchName FROM branch WHERE branchID IN (
                          SELECT branchID FROM customer_subscription WHERE customerID IN (
                              SELECT customerID FROM borrowed WHERE payFine IS NOT NULL
                          )
                      )
                  )
GROUP BY br.customerID, b.branchName
ORDER BY totalFine ASC;

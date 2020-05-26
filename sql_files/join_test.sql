SELECT cs.customerID, cs.branchID, customer.firstName, customer.lastName
FROM customer_subscription AS cs
INNER JOIN customer ON customer.customerID = cs.customerID;

SELECT baddr.branchID, br.branchManager, baddr.region, baddr.city, baddr.state
FROM branch_address AS baddr
INNER JOIN branch AS br ON br.branchID = baddr.branchID;

SELECT * FROM books
LEFT JOIN author ON books.authorID = author.authorID
UNION
SELECT * FROM books
RIGHT JOIN author ON books.authorID = author.authorID;

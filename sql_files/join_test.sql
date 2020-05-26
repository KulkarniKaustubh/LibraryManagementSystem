SELECT cs.customerID, cs.branchID, customer.firstName, customer.lastName
FROM customer_subscription AS cs
JOIN customer ON customer.customerID = cs.customerID;

SELECT baddr.branchID, br.branchManager, baddr.region, baddr.city, baddr.state
FROM branch_address AS baddr
JOIN branch AS br ON br.branchID = baddr.branchID;

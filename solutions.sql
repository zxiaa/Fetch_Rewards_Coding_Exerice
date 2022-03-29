/*Which brand has the most spend among users who were created within the past 6 months?*/

SELECT name FROM brands b,
(SELECT * FROM receipts 
WHERE totalspent = (SELECT MAX(totalspent) 
FROM receipts r,
(SELECT * FROM users
WHERE createddate>='01-SEP-28') u WHERE u.id = r.userid)) r 
WHERE b.brandcode = r.itl_brandcode;

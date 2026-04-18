---Query 1  Show customer name and how many policies each customer has taken.

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(p.policy_id) AS total_policies
FROM customers c
LEFT JOIN policies p
    ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_policies DESC;


---Query 2--  Show the total premium amount collected from all policies.

SELECT 
    SUM(premium_amount) AS total_premium_collected
FROM policies;

--Query 3 Show customer name and total premium amount paid by each customer. 

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(pmt.amount) AS total_premium_paid
FROM customers c
JOIN policies pol
    ON c.customer_id = pol.customer_id
JOIN payments pmt
    ON pol.policy_id = pmt.policy_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_premium_paid DESC;


---Query 4  Show agent name and how many policies each agent has sold.
SELECT 
    a.agent_id, a.first_name,a.last_name,
    COUNT(p.policy_id) AS total_policies_sold
FROM agents a
LEFT JOIN policies p
    ON a.agent_id = p.agent_id
GROUP BY 
    a.agent_id,
    a.first_name,
    a.last_name
ORDER BY total_policies_sold DESC;

--Query 5   Show policy id and total claim amount for each policy.

SELECT policy_id,
    SUM(amount_claimed) AS total_claim_amount
FROM claims
GROUP BY policy_id
ORDER BY total_claim_amount DESC;

---Query 6  Show policy id and claim status where the claim is Approved. 

SELECT policy_id,
status FROM claims
WHERE status = 'Approved';


--Query 7   Show policy id and total payment amount received for each policy. 

SELECT  policy_id,
SUM(amount) AS total_payment_received FROM payments
GROUP BY policy_id
ORDER BY total_payment_received DESC;


--Query 8  Show all customers and their policy ids. Also include customers who have not taken any policy. 

SELECT c.customer_id,c.first_name,c.last_name,
p.policy_id FROM customers c
LEFT JOIN policies p
    ON c.customer_id = p.customer_id
ORDER BY c.customer_id;

--Query 9 Show policy type and average premium amount for each policy type. 

SELECT  policy_type,
AVG(premium_amount) AS avg_premium_amount FROM policies
GROUP BY policy_type
ORDER BY avg_premium_amount DESC;


---Query 10 Show agent name and total commission earned by each agent. 
---Commission = premium_amount × commission_rate / 100

SELECT a.agent_id,a.first_name,a.last_name,
SUM(p.premium_amount * a.commission_rate / 100) AS total_commission_earned FROM agents a
JOIN policies p ON a.agent_id = p.agent_id
GROUP BY 
    a.agent_id,
    a.first_name,
    a.last_name
ORDER BY total_commission_earned DESC;




























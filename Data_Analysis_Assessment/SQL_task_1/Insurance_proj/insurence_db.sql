-----TASK 1: Database & Table Creation (DDL) 

---- Create customers table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    aadhaar_number VARCHAR(20),
    pan_number VARCHAR(20)
);

---- Create agents table

CREATE TABLE agents (
    agent_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    commission_rate DECIMAL(5,2)
);

---- Create policies table

CREATE TABLE policies (
    policy_id INT PRIMARY KEY,
    policy_type VARCHAR(50),
    coverage_amount NUMERIC(12,2),
    premium_amount NUMERIC(12,2),
    start_date DATE,
    end_date DATE,
    customer_id INT,
    agent_id INT,
    approved_by VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);

---- Create claims table


CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    claim_date DATE,
    amount_claimed NUMERIC(12,2),
    status VARCHAR(20),
    policy_id INT,
    approved_by VARCHAR(100),
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

---- Create payments table

CREATE TABLE payments (
    payment_uuid UUID PRIMARY KEY,
    payment_date DATE,
    amount NUMERIC(12,2),
    payment_method VARCHAR(30),
    policy_id INT,
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

select * from agents;


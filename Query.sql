-- Create Database
create database insurancedb;

-- set default
use insurancedb;

-- check Data
select * from insurancedata;

-- Total Premium by Policy Type
SELECT 
    PolicyType,
    SUM(PremiumAmount) AS TotalPremium
FROM InsuranceTransactions
GROUP BY PolicyType;

-- Claim Amount by Age Group
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Young Adult'
        WHEN Age BETWEEN 25 AND 45 THEN 'Adult'
        ELSE 'Senior'
    END AS AgeGroup,
    SUM(ClaimAmount) AS TotalClaimAmount
FROM InsuranceTransactions
GROUP BY AgeGroup;

-- Active vs Inactive Policies
SELECT 
    CASE 
        WHEN PolicyEndDate >= CURDATE() THEN 'Active'
        ELSE 'Inactive'
    END AS PolicyStatus,
    COUNT(*) AS PolicyCount
FROM InsuranceTransactions
GROUP BY PolicyStatus;

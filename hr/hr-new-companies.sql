-- Query: Return company code, founder along with counts of lead manager, senior manager, manager, and employees
SELECT
    c.company_code,
    c.founder,
    lm.lm_count,
    sm.sm_count,
    m.m_count,
    e.e_count
FROM Company c
INNER JOIN (SELECT company_code, COUNT(DISTINCT lead_manager_code) AS lm_count FROM Lead_Manager GROUP BY 1) AS lm ON lm.company_code = c.company_code
INNER JOIN (SELECT company_code, COUNT(DISTINCT senior_manager_code) AS sm_count FROM Senior_Manager GROUP BY 1) AS sm ON sm.company_code = c.company_code
INNER JOIN (SELECT company_code, COUNT(DISTINCT manager_code) AS m_count FROM Manager GROUP BY 1) AS m ON m.company_code = c.company_code
INNER JOIN (SELECT company_code, COUNT(DISTINCT employee_code) AS e_count FROM Employee GROUP BY 1) AS e ON e.company_code = c.company_code
ORDER BY 1 ASC;

/*
Algorithm Breakdown:
    1. Aggregate each non-Company table on company_code identifier
    2. INNER JOIN each aggregated table to Company table
    3. Return desired columns 
*/
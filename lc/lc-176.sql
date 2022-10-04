-- Query 1: Report second highest salary
SELECT
    DISTINCT salary AS SecondHighestSalary
FROM Employee
ORDER BY salary DESC
LIMIT 1,1;


-- Query 2: Report second highest salary, if does not exist report NULL instead
SELECT (
    SELECT
        DISTINCT salary
    FROM Employee 
    ORDER BY salary DESC 
    LIMIT 1,1
) AS SecondHighestSalary


/*
Algorithm Breakdown:
    1. Sort salaries in descending order
    2. Limit output to 1, offset by 1 to get second highest salary
    3. Nest query in a subquery to show NULL instead of empty return
*/
-- Query: Search for nth highest salary, user inputs n
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE M INT;
    SET M = N - 1;
    RETURN (
        SELECT
            DISTINCT salary as getNthHighestSalary
        FROM Employee
        ORDER BY salary DESC
        LIMIT M, 1
    );
END

/*
Algorithm Breakdown:
    1. In order to get the nth value, we must offset the query by n-1. Therefore, declare variable M to store n - 1
    2. Query for distinct salaries in descending order
    3. Offset by M and limit output to 1
*/
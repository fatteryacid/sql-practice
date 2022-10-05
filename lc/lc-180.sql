-- Query: Find all numbers that appear at least 3 times consecutively
SELECT
    DISTINCT t1.num AS ConsecutiveNums
FROM Logs t1
LEFT JOIN Logs t2 ON t2.id + 1 = t1.id AND t2.num = t1.num
LEFT JOIN Logs t3 ON t3.id + 2 = t1.id AND t3.num = t1.num
WHERE t2.num IS NOT NULL AND t3.num IS NOT NULL;

/*
Algorithm Breakdown:
    1. LEFT JOIN (self) on n+1 and n+2, where n is the unique identifier and where nums match
    2. Return all distinct numbers that have non-null matches in n+1 and n+2 tables
*/
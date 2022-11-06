--Query: Find number of challenges each hacker completed. If multiple hackers completed same number of challenges, only display if num of challenges is max.

-- CTE cut down query writing
WITH cte AS (
    SELECT
        COUNT(*) cnt
    FROM Challenges
    GROUP BY hacker_id
)
-- Main SELECT begins here
SELECT
    c.hacker_id,
    h.name,
    COUNT(*) c_cnt
FROM Challenges c
INNER JOIN Hackers h ON h.hacker_id = c.hacker_id
GROUP BY 1, 2
HAVING 
    -- Filter out duplicates
    c_cnt IN (
        SELECT
            cnt
        FROM (SELECT cnt, COUNT(*) occ FROM cte GROUP BY cnt HAVING COUNT(*) = 1) AS temp1
    ) OR
    -- Accept duplicates if they are equal to MAX
    c_cnt = (
        SELECT
            MAX(cnt)
        FROM cte
    )
ORDER BY 3 DESC, 1

-- Unable to use window functions
SELECT
    t1.hacker_id,
    h.name,
    SUM(max_score) total_score
FROM (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) max_score
    FROM Submissions s
    GROUP BY 1, 2
) t1
INNER JOIN Hackers h ON h.hacker_id = t1.hacker_id
GROUP BY 1, 2
HAVING total_score > 0
ORDER BY 3 DESC, 1 ASC

/*
  Algorithm Breakdown:
    1. Aggregate for max scores for each hacker, for each challenge using scores.
    2. Aggregate for total scores for each hacker using max scores.
    3. Filter out total_score = 0 and sort accordingly.
*/

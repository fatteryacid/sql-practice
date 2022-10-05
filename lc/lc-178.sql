-- Query: Rank scores from highest to lowest, ties should have same rank but not skip any rank numbers
SELECT
    score,
    DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores
;

/*
Algorithm Breakdown:

    1. Use DENSE_RANK() window function for continuous ranks
    2. Skip PARTITION BY clause and only use ORDER BY
    3. Query score alongside with its rank
*/
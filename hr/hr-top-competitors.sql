-- Query: Return id and name of all hackers who received full score on challenges, ordered by occurence of full scores DESC and hacker_id ASC
SELECT
    t1.hacker_id,
    t2.name
FROM (
    SELECT
        s.hacker_id,
        COUNT(DISTINCT s.challenge_id) AS occurences
    FROM Submissions s
    INNER JOIN Challenges c ON c.challenge_id = s.challenge_id
    INNER JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
    WHERE s.score = d.score
    GROUP BY 1
    HAVING COUNT(DISTINCT s.challenge_id) > 1
) AS t1
INNER JOIN Hackers AS t2 ON t2.hacker_id = t1.hacker_id
ORDER BY t1.occurences DESC, t1.hacker_id ASC
;

/*
Algorithm Breakdown:
    1. INNER JOIN all tables except Hackers table to Submissions table since every submission has relevant challenge and difficulty
    2. Aggregate DISTINCT challenge_ids where submission score is equal to max score, only returning values that have more than 1 occurence
    3. Wrap in results as subquery (t1) and INNER JOIN Hackers table to gain access to name attribute
    4. ORDER BY COUNT aggregation DESC, then hacker_id ASC
*/
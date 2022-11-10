SELECT
    w2.id,
    t1.age,
    t1.galleons,
    t1.pow
FROM (
    SELECT
        w.code, 
        p.age,
        min(w.coins_needed) galleons,
        w.`power` pow
    FROM Wands w
    INNER JOIN Wands_Property p ON p.code = w.code
    WHERE p.is_evil = 0
    GROUP BY w.code, p.age, pow
) t1
INNER JOIN Wands w2 ON w2.code = t1.code AND w2.`power` = t1.pow AND w2.coins_needed = t1.galleons
ORDER BY 4 DESC, 2 DESC

/*
  Algorithm Breakdown:
    1. For each code group, find the MIN coins_needed at each level of age and power.
      - For example, at each level (age=<some_number>) for each power find the aggregated MIN()
    2. INNER JOIN back Wands table to get ID.
      - We cannot include ID in subquery so we can aggregate at the code level.
*/

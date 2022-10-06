-- Query: Find median of LAT_N
WITH sub AS (
    SELECT
        LAT_N,
        ROW_NUMBER() OVER(ORDER BY LAT_N ASC) AS r_num
    FROM STATION
)
SELECT
    CASE
        WHEN MOD(COUNT(*), 2) = 0 THEN (SELECT ROUND(SUM(LAT_N)/2, 4) FROM sub WHERE r_num IN (CEILING(COUNT(*)/2), CEILING(COUNT(*)/2) + 1))
        WHEN MOD(COUNT(*), 2) != 0 THEN (SELECT ROUND(LAT_N, 4) FROM sub WHERE r_num = CEILING(COUNT(*)/2))
    END AS median
FROM sub
;

/*
Algorithm Breakdown:
    1. Find total number of rows, find modulus of division by 2
    2. If mod = 0: Need to find average
        - index_1 = n // 2
        - index_2 = index_1 + 1
       If mod != 0: Get center value in terms of index
        - index = n // 2
*/
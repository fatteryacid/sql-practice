-- Query: Find Euclidean distance
SELECT
    ROUND(
        SQRT(
            POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)
        )
    ,4)
FROM STATION;

/*
Algorithm Breakdown:
    1. Decipher formula: Formula - SQRT((b - a)**2 + (d - c)**2)
    2. Map variables to SQL queries:
        a - MIN(LAT_N)
        b - MAX(LAT_N)
        c - MIN(LONG_W)
        d - MAX(LONG_W)
    3. Convert mathematic formula to query
*/
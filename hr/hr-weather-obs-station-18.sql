-- Query: Find Manhattan Distance
SELECT
    ROUND(
        ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W))
    , 4)
FROM STATION

/*
Algorithm Breakdown:
    1. Calculate x and y differences within ABS() to find absolute value
    2. Return value rounded to 4 decimal places using ROUND([expression], 4)
*/
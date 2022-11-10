-- Fun one

WITH a AS (
    SELECT
        start_date,
        end_date,
        LAG(end_date, 1, end_date) OVER(ORDER BY start_date) prev_end
    FROM Projects
),
b AS (
    SELECT
        start_date,
        end_date,
        SUM(CASE WHEN prev_end = start_date THEN 0 ELSE 1 END) OVER(ORDER BY start_date) my_rank
    FROM a
),
c AS (
    SELECT
        min(start_date) start_d,
        max(end_date) end_d,
        max(end_date) - min(start_date) diff
    FROM b
    GROUP BY my_rank
)
SELECT
    start_d,
    end_d
FROM c
ORDER BY diff ASC


/*
  Algorithm Breakdown:
    1. Use LAG() function to check for previous end dates
    2. Use SUM() to create rolling sum as a surrogate rank
      - For example, if the previous end date was 2015-03-04 and the current start date is 2015-03-21, we add 1 to the rolling sum
      - However, if previous end date was 2015-03-04 and the current start date is 2015-03-04, we add 0 to maintain the rank
    3. Aggregate smallest start date, largest end date, and their difference grouped by our surrogate rank
    4. Return query based on the difference
*/

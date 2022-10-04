-- Query 1: Return pivoted table
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS doc,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS prof,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS actor
FROM (
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name ASC) as row_num
    FROM OCCUPATIONS
) AS t1
GROUP BY row_num


/*
Algorithm Breakdown:

    1. Create a row number column to group together rankings based on each Occupation label
    2. Write CASE statements to return Name that corresponds to correct profession
    3. Wrap each CASE statement in an aggregate function (MAX() and MIN() both work here) in order to use GROUP BY clause.
    4. GROUP BY row_num to eliminate all extra NULLs.
*/
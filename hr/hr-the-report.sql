-- Query: Return student names, omit names with grades less than 8. Order by grades DESC and names ASC.
SELECT
    CASE WHEN g.Grade >= 8 THEN s.Name ELSE NULL END AS Name,
    g.Grade,
    s.Marks
FROM Grades g
INNER JOIN Students s ON s.Marks >= g.Min_Mark AND s.Marks <= g.Max_Mark
ORDER BY 2 DESC, 1 ASC;

/*
Algorithm Breakdown:
    1. INNER JOIN Students and Grades on Mark using upper and lower bound since each student will have a grade
    2. CASE WHEN to return NULL when Grade is < 8
    3. ORDER BY accordingly
*/

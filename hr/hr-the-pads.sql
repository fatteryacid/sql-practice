-- Query 1: Concatenates name with first initial of occupation
SELECT CASE
    WHEN Occupation = 'Doctor' THEN CONCAT(Name, '(D)')
    WHEN Occupation = 'Professor' THEN CONCAT(Name, '(P)')
    WHEN Occupation = 'Singer' THEN CONCAT(Name, '(S)')
    WHEN Occupation = 'Actor' THEN CONCAT(Name, '(A)')
    END
FROM OCCUPATIONS
ORDER BY Name ASC;

-- Query 2: Returns count of occupations in human-readable format
SELECT CASE
    WHEN Occupation = 'Doctor' THEN CONCAT('There are a total of ', o_cnt, ' doctors.')
    WHEN Occupation = 'Singer' THEN CONCAT('There are a total of ', o_cnt, ' singers.')
    WHEN Occupation = 'Actor' THEN CONCAT('There are a total of ', o_cnt, ' actors.')
    WHEN Occupation = 'Professor' THEN CONCAT('There are a total of ', o_cnt, ' professors.')
    END
FROM (SELECT Occupation, COUNT(*) o_cnt FROM OCCUPATIONS GROUP BY Occupation) agg
ORDER BY agg.o_cnt ASC;

/*
    SQL Server 2022 
    - IS [NOT] DISTINCT FROM
*/

SELECT @@VERSION

CREATE TABLE #testsql2022 (ColA int, ColB int)
INSERT INTO #testsql2022 (ColA, ColB)
VALUES (0, 0), (0, 1), (0, NULL), (NULL, NULL)
SELECT * FROM #testsql2022

SELECT * FROM #testsql2022

/*
    Comparing two values
*/

-- =  only returns rows where values in both columns are identical, excluding those with NULLs
SELECT * FROM #testsql2022
SELECT ColA, ColB, 'ColA = ColB' FROM #testsql2022 WHERE ColA = ColB

-- <> only returns rows where values in both columns are different, excluding those with NULLs
SELECT * FROM #testsql2022
SELECT ColA, ColB, 'ColA <> ColB' FROM #testsql2022 WHERE ColA <> ColB

-- IS NOT DISTINCT FROM returns rows where values in both columns are identical, including rows where both are NULL
SELECT * FROM #testsql2022
SELECT ColA, ColB, 'ColA IS NOT DISTINCT FROM ColB' FROM #testsql2022 WHERE ColA IS NOT DISTINCT FROM ColB

-- IS DISTINCT FROM returns rows where values in both columns are different, including when one of them is NULL
SELECT * FROM #testsql2022
SELECT ColA, ColB, 'ColA IS DISTINCT FROM ColB' FROM #testsql2022 WHERE ColA IS DISTINCT FROM ColB

/*
    Comparing with NULL values
*/

-- =/ <> NULL comparison with NULL values always results in an empty set
SELECT * FROM #testsql2022
SELECT ColA, ColB, 'ColA = NULL' FROM #testsql2022 WHERE ColA = NULL
SELECT ColA, ColB, 'ColA <> NULL' FROM #testsql2022 WHERE ColA <> NULL

-- IS NOT DISTINCT FROM NULL returns rows where the first column contains NULL
SELECT * FROM #testsql2022
SELECT ColA, ColB, 'ColA IS NOT DISTINCT FROM NULL' FROM #testsql2022 WHERE ColA IS NOT DISTINCT FROM NULL

-- IS DISTINCT FROM NULL returns rows where the first column is not NULL
SELECT * FROM #testsql2022
SELECT ColA, ColB, 'ColA IS DISTINCT FROM NULL' FROM #testsql2022 WHERE ColA IS DISTINCT FROM NULL

/*
    SQL Server 2022
    - GENERATE_SERIES function
*/

ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 160
GO

USE AdventureWorks2019
GO

SELECT * FROM GENERATE_SERIES(1, 21)

SELECT value FROM GENERATE_SERIES(1, 21, 5)


-- decimal values
SELECT value FROM GENERATE_SERIES(1.0, 10.0, 1.0)

SELECT value FROM GENERATE_SERIES(1.0, 10.0, 1.5)

-- all arguments must be of the same data type as the first (start)

-- ! Msg 8116, Level 16, State 3, Line 38
-- ! Argument data type int is invalid for argument 3 of generate_series function.
SELECT value FROM GENERATE_SERIES(1.0, 10.0, 1)

-- ! Msg 8116, Level 16, State 2, Line 42
-- ! Argument data type int is invalid for argument 2 of generate_series function.
SELECT value FROM GENERATE_SERIES(1.0, 10, 1.0)

-- negative values
SELECT value FROM GENERATE_SERIES(21, 1, -1)

-- empty set
SELECT value FROM GENERATE_SERIES(1, 21, -1)
SELECT value FROM GENERATE_SERIES(21, 1, 1)

-- compatibility level
ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 150
GO

-- ! Msg 208, Level 16, State 1, Line 68
-- ! Invalid object name 'GENERATE_SERIES'.
SELECT value FROM GENERATE_SERIES(1, 21)

ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 160
GO

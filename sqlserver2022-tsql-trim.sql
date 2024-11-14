/*
    SQL Server 2022 
    - TRIM, LTRIM, RTRIM functions
*/

USE AdventureWorks2019

-- before SQL Server 2017
SELECT LTRIM(RTRIM( '  test    '))

/*
    TRIM
*/

-- SQL Server 2017-2019
-- TRIM ( [ characters FROM ] string )

-- removing spaces
SELECT '  test    '
SELECT TRIM ( '  test    ')
SELECT TRIM ( ' ' FROM  '   test    ' )

-- removing not only spaces
SELECT TRIM ( '#' FROM  '##test###' )
SELECT TRIM ( '#' FROM  ' # test # ' )

-- removing spaces and #
SELECT TRIM ( ' #' FROM  ' # test # ' )

-- SQL Server 2022
-- TRIM ( [ LEADING | TRAILING | BOTH ] [characters FROM ] string )
SELECT TRIM ( LEADING ' #' FROM  ' # test # ' )
SELECT TRIM ( TRAILING ' #' FROM  ' # test # ' )
SELECT TRIM ( BOTH ' #' FROM  ' # test # ' )

-- minimum compatibility level 160
ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 150
GO
SELECT TRIM ( ' #' FROM  ' # test # ' )
GO

ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 160
GO

/*
    LTRIM
*/

-- SQL Server 2019
-- LTRIM ( character_expression )

SELECT '  # test #  '
UNION ALL
SELECT LTRIM ( '  # test #  ' )

-- SQL Server 2022
-- LTRIM ( character_expression , [ characters ] )

SELECT '  # test #  '
UNION ALL
SELECT LTRIM ( '  # test #  ' , '#')
UNION ALL
SELECT LTRIM ( '  # test #  ' , ' #')

/*
    RTRIM
*/

-- SQL Server 2019
-- RTRIM ( character_expression )

SELECT '  # test #  '
UNION ALL
SELECT RTRIM ( '  # test #  ' )

-- SQL Server 2022
-- RTRIM ( character_expression , [ characters ] )

SELECT '  # test #  '
UNION ALL
SELECT RTRIM ( '  # test #  ' , '#')
UNION ALL
SELECT RTRIM ( '  # test #  ' , ' #')

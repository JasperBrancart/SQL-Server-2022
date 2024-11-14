/*
    SQL Server 2022
    - DATE_BUCKET function

*/

USE AdventureWorks2019
GO

SELECT 'month' AS _datepart, DATE_BUCKET(MONTH, 1, SYSDATETIME()) AS _date_bucket1
UNION ALL
SELECT 'week', DATE_BUCKET(WEEK, 1, SYSDATETIME())
UNION ALL
SELECT 'day', DATE_BUCKET(DAY, 1, SYSDATETIME())

-- every second month/week/day
-- month: 1/ Jan-Feb 2/ Mar-Apr 3/ May-Jun 4/ Jul-Aug

SELECT 'month' AS _datepart, DATE_BUCKET(MONTH, 2, SYSDATETIME()) AS _date_bucket2
UNION ALL
SELECT 'week', DATE_BUCKET(WEEK, 3, SYSDATETIME())
UNION ALL
SELECT 'day', DATE_BUCKET(DAY, 2, SYSDATETIME())

-- origin other than the default 1900-01-01 (counting from August 5)
SELECT 'month' AS _datepart, 
    DATE_BUCKET(MONTH, 1, SYSDATETIME(), CAST('20220805' AS datetime2)) AS _date_bucket1_origin_20220805

-- start of the week, counting from August 5
SELECT 'week' AS _datepart, 
    DATE_BUCKET(WEEK, 1, SYSDATETIME(), CAST('20220805' AS datetime2)) AS _date_bucket1_origin_20220805

-- every second month, starting from February 2022
-- 1/ Feb-Mar 2/ Apr-May 3/ Jun-Jul 4/ Aug-Sep
SELECT 'month' AS _datepart, 
    DATE_BUCKET(MONTH, 2, SYSDATETIME(), CAST('20220201' AS datetime2)) AS _date_bucket2_origin_20220201

/*
    Grouping data based on intervals
*/

SELECT OrderDate, 'month', DATE_BUCKET(MONTH, 1, OrderDate)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011

SELECT DATE_BUCKET(MONTH, 1, OrderDate), count(*)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY DATE_BUCKET(MONTH, 1, OrderDate)
ORDER BY DATE_BUCKET(MONTH, 1, OrderDate)

SELECT MONTH(OrderDate), count(*)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY MONTH(OrderDate)
ORDER BY MONTH(OrderDate)

SELECT OrderDate, 'month', DATE_BUCKET(MONTH, 2, OrderDate)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011

SELECT DATE_BUCKET(MONTH, 2, OrderDate), count(*)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY DATE_BUCKET(MONTH, 2, OrderDate)
ORDER BY DATE_BUCKET(MONTH, 2, OrderDate)

SELECT OrderDate, 'week', DATE_BUCKET(WEEK, 1, OrderDate)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011

SELECT DATE_BUCKET(WEEK, 1, OrderDate), count(*)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY DATE_BUCKET(WEEK, 1, OrderDate)
ORDER BY DATE_BUCKET(WEEK, 1, OrderDate)

SELECT OrderDate, 'week', DATE_BUCKET(WEEK, 2, OrderDate)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011

SELECT DATE_BUCKET(WEEK, 2, OrderDate), count(*)
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY DATE_BUCKET(WEEK, 2, OrderDate)
ORDER BY DATE_BUCKET(WEEK, 2, OrderDate)

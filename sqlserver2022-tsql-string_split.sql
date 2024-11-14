/*
    SQL Server 2022 
    - STRING_SPLIT function
*/

USE AdventureWorks2019

SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ')

-- minimum compatibility level 130
ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 120
GO

-- ! 208 Invalid object name 'STRING_SPLIT'.
SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ')

ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 130
GO

SELECT * FROM STRING_SPLIT('Chisel Epic Epic EVO Epic FSR Epic Hardtail Riprock', ' ')

-- comma-separated values, including an empty value
DECLARE @tags NVARCHAR(400) = 'Chisel,Epic,Epic EVO,Epic FSR,,Epic Hardtail,Riprock'  

SELECT value  
FROM STRING_SPLIT(@tags, ',')  

-- removing empty values
SELECT value  
FROM STRING_SPLIT(@tags, ',')  
WHERE RTRIM(value) <> ''
GO

/*
    enable_ordinal
    A value of 1 enables the ordinal column. 
    If enable_ordinal is omitted, NULL, or has a value of 0, the ordinal column is disabled.
*/

SELECT * 
FROM STRING_SPLIT('Chisel Epic Epic EVO Epic FSR Epic Hardtail Riprock', ' ')

SELECT * 
FROM STRING_SPLIT('Chisel Epic Epic EVO Epic FSR Epic Hardtail Riprock', ' ', 1)

-- empty values are also numbered
DECLARE @tags NVARCHAR(400) = 'Chisel,Epic,Epic EVO,Epic FSR,,Epic Hardtail,Riprock'  

SELECT * FROM STRING_SPLIT(@tags, ',', 1)  

-- using the ordinal column directly in a query, e.g., for filtering
SELECT * 
FROM STRING_SPLIT('Chisel Epic Epic EVO Epic FSR Epic Hardtail Riprock', ' ', 1)
WHERE ordinal % 2 = 0

-- varchar(max) data type
DECLARE @tags varchar(max) = 
    REPLICATE(CAST('Chisel,Epic,Epic EVO,Epic FSR,Epic Hardtail,Riprock,' AS varchar(max)), 2000)

SELECT @tags
SELECT LEN(@tags) AS tags_LEN
  
SELECT * FROM STRING_SPLIT(@tags, ',', 1)  

ALTER DATABASE AdventureWorks2019 SET COMPATIBILITY_LEVEL = 160
GO

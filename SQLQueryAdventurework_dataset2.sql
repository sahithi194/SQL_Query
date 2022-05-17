-------------VIEWS---------

CREATE VIEW MyCustomUSView
AS
SELECT * FROM [Sales].[SalesTerritory]
WHERE CountryRegionCode LIKE 'US'

SELECT * FROM MyCustomUSView

CREATE VIEW NASalesQuota
AS 
SELECT [Name], [Group], SalesQuota, Bonus 
FROM [Sales].[SalesTerritory] A INNER JOIN [Sales].[SalesPerson] B
ON A.TerritoryID = B.TerritoryID
WHERE [Group] LIKE 'North America'

SELECT * FROM NASalesQuota
SELECT * FROM [Sales].[SalesPerson]
SELECT * FROM [Sales].[SalesTerritory]

----------TRIGGER-----------------
----------------------------------

SELECT * FROM [HumanResources].[Shift]

CREATE TRIGGER Demo_Trigger
ON [HumanResources].[Shift]
AFTER INSERT
AS
BEGIN
PRINT 'INSERT IS NOT ALLOWED. YOU NEED APPROVAL'
ROLLBACK TRANSACTION
END
GO

---------TEST THE TRIGGER-------
INSERT INTO [HumanResources].[Shift]
([Name],
[StartTime],
[EndTime],[ModifiedDate])
VALUES
('RAKESH'
,'07:00:00.0000000',
'11:00:00.0000000',
getdate())

------------------------------------------------
-------DATABASE LEVEL TRIGGER-------------------
CREATE TRIGGER DBLevelTrigger
ON DATABASE
AFTER CREATE_TABLE
AS
BEGIN
PRINT 'CREATION OF NEW TABLE NOT ALLOWED'
ROLLBACK TRANSACTION
END
GO

CREATE TABLE DEMOTABLE(Col VARCHAR(10))

-------------------------------------------------
-----------COMPUTED COLUMNS----------------------


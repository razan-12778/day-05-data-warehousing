CREATE OR REPLACE TABLE `lewagon-de-student-7.sales_mart.TerritoryDim` AS
SELECT
    TerritoryID,
    Name AS TerritoryName,
    CountryRegionCode,
    `Group` AS SalesGroup
FROM `lewagon-de-student-7.adventure_works_raw.SalesTerritory`;

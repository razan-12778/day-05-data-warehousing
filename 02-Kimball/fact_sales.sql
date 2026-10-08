CREATE OR REPLACE TABLE `lewagon-de-student-7.sales_mart.Fact_Sales` AS
SELECT
    sod.SalesOrderDetailID,
    sod.SalesOrderID,
    DATE(soh.OrderDate) AS DateKey,
    soh.TerritoryID,
    sod.SpecialOfferID,
    sod.ProductID,
    sod.OrderQty AS Quantity,
    sod.UnitPrice,
    sod.UnitPriceDiscount,
    sod.LineTotal AS SalesAmount
FROM `lewagon-de-student-7.adventure_works_raw.SalesOrderDetail` AS sod
JOIN `lewagon-de-student-7.adventure_works_raw.SalesOrderHeader` AS soh
    ON sod.SalesOrderID = soh.SalesOrderID;

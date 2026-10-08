CREATE OR REPLACE VIEW `lewagon-de-student-7.sales_mart.AnalystSalesView` AS
SELECT
    f.SalesOrderID,
    f.SalesOrderDetailID,
    f.Quantity AS OrderQty,
    f.UnitPrice,
    f.SalesAmount AS LineTotal,
    f.DateKey AS SalesOrderDate,
    d.Year AS SalesOrderYear,
    so.Description AS SpecialOfferDescription,
    so.DiscountPct AS SpecialOfferDiscount,
    t.TerritoryName,
    t.CountryRegionCode AS TerritoryCountry,
    t.SalesGroup AS TerritoryGroup
FROM `lewagon-de-student-7.sales_mart.Fact_Sales` AS f
JOIN `lewagon-de-student-7.sales_mart.DateDim` AS d
    ON f.DateKey = d.DateKey
JOIN `lewagon-de-student-7.sales_mart.SpecialOfferDim` AS so
    ON f.SpecialOfferID = so.SpecialOfferID
LEFT JOIN `lewagon-de-student-7.sales_mart.TerritoryDim` AS t
    ON f.TerritoryID = t.TerritoryID;

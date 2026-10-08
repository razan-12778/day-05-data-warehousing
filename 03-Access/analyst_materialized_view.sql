CREATE OR REPLACE MATERIALIZED VIEW `lewagon-de-student-7.sales_mart.AnalystMaterializedView`
AS
SELECT
    DATE(f.DateKey) AS SalesOrderDate,
    EXTRACT(YEAR FROM f.DateKey) AS SalesOrderYear,
    t.TerritoryName,
    t.CountryRegionCode AS TerritoryCountry,
    t.SalesGroup AS TerritoryGroup,
    so.Description AS SpecialOfferDescription,
    so.DiscountPct AS SpecialOfferDiscount,
    SUM(f.Quantity) AS TotalOrderQty,
    SUM(f.SalesAmount) AS TotalSalesAmount
FROM `lewagon-de-student-7.sales_mart.Fact_Sales` AS f
JOIN `lewagon-de-student-7.sales_mart.SpecialOfferDim` AS so
    ON f.SpecialOfferID = so.SpecialOfferID
LEFT JOIN `lewagon-de-student-7.sales_mart.TerritoryDim` AS t
    ON f.TerritoryID = t.TerritoryID
GROUP BY
    SalesOrderDate,
    SalesOrderYear,
    TerritoryName,
    TerritoryCountry,
    TerritoryGroup,
    SpecialOfferDescription,
    SpecialOfferDiscount;

-- Query 1: Highest-performing Special Offer
SELECT
    so.Description,
    SUM(f.SalesAmount) AS TotalSales,
    so.DiscountPct
FROM `lewagon-de-student-7.sales_mart.Fact_Sales` AS f
JOIN `lewagon-de-student-7.sales_mart.SpecialOfferDim` AS so
    ON f.SpecialOfferID = so.SpecialOfferID
WHERE so.Description != 'No Discount'
GROUP BY
    so.Description,
    so.DiscountPct
ORDER BY TotalSales DESC
LIMIT 1;


-- Query 2: Sales Performance by Group
SELECT
    t.SalesGroup,
    SUM(f.SalesAmount) AS TotalSales
FROM `lewagon-de-student-7.sales_mart.Fact_Sales` AS f
JOIN `lewagon-de-student-7.sales_mart.TerritoryDim` AS t
    ON f.TerritoryID = t.TerritoryID
GROUP BY
    t.SalesGroup
ORDER BY TotalSales DESC;

CREATE OR REPLACE TABLE `lewagon-de-student-7.sales_mart.MonthlySalesSnapshotFact` AS
SELECT
    DATE_TRUNC(f.DateKey, MONTH) AS Month,
    f.TerritoryID,
    SUM(f.SalesAmount) AS MonthlySalesAmount,
    SUM(f.Quantity) AS MonthlyQuantity
FROM `lewagon-de-student-7.sales_mart.Fact_Sales` AS f
GROUP BY
    Month,
    f.TerritoryID;

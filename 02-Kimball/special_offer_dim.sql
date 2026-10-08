CREATE OR REPLACE TABLE `lewagon-de-student-7.sales_mart.SpecialOfferDim` AS
SELECT
    SpecialOfferID,
    Description,
    DiscountPct,
    Type,
    Category,
    DATE(StartDate) AS StartDate,
    DATE(EndDate) AS EndDate,
    MinQty,
    MaxQty
FROM `lewagon-de-student-7.adventure_works_raw.SpecialOffer`;

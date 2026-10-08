CREATE OR REPLACE TABLE `lewagon-de-student-7.sales_mart.DateDim` AS
WITH date_range AS (
    SELECT
        MIN(DATE(OrderDate)) AS MinDate,
        MAX(DATE(OrderDate)) AS MaxDate
    FROM `lewagon-de-student-7.adventure_works_raw.SalesOrderHeader`
)

SELECT
    Date AS DateKey,
    Date,
    EXTRACT(YEAR FROM Date) AS Year,
    EXTRACT(QUARTER FROM Date) AS Quarter,
    EXTRACT(MONTH FROM Date) AS Month,
    FORMAT_DATE('%B', Date) AS MonthName
FROM date_range,
UNNEST(GENERATE_DATE_ARRAY(MinDate, MaxDate)) AS Date;

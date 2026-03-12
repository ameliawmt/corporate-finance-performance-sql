-- Total Spend by Vendor

SELECT
  year,
  vendor,
  
CONCAT('$', FORMAT("%'d", CAST(SUM(fcst_act_amount) AS INT64))) AS total_spend

FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`

GROUP BY year, vendor
ORDER BY year, total_spend DESC;

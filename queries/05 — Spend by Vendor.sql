-- Total spend by vendor

SELECT
  year,
  vendor,
  SUM(fcst_act_amount) AS total_spend
FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`
GROUP BY year, vendor
ORDER BY year, total_spend DESC;

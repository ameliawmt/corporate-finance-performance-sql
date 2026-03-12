-- Total Spend by Budget Owner

SELECT
  year,
  budget_owner,
  
CONCAT('$', FORMAT("%'d", CAST(SUM(fcst_act_amount) AS INT64))) AS total_spend

FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`

GROUP BY year, budget_owner
ORDER BY year, total_spend DESC;
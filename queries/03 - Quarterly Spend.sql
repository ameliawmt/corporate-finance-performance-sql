-- Total Spend by Quarter

SELECT
  year,
  quarter,
  
CONCAT('$', FORMAT("%'d", CAST(SUM(fcst_act_amount) AS INT64))) AS total_spend

FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`

GROUP BY year, quarter
ORDER BY year, quarter;

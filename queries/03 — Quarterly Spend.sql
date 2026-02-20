-- Total spend by quarter

SELECT
  year,
  quarter,
  SUM(fcst_act_amount) AS total_spend
FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`
GROUP BY year, quarter
ORDER BY year, quarter;

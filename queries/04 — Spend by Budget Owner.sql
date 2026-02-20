-- Total spend by budget owner

SELECT
  year,
  budget_owner,
  SUM(fcst_act_amount) AS total_spend
FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`
GROUP BY year, budget_owner
ORDER BY year, total_spend DESC;

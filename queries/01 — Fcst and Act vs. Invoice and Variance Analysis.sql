-- Forecast/Actuals vs. Invoice Amounts and Variance Analysis

SELECT
  year,
  team,
  CASE
    WHEN year = 2025 THEN 'Act'
    WHEN year = 2026 THEN 'Fcst'
    ELSE 'UNKNOWN'
  END AS plan_type,
  SUM(fcst_act_amount) AS total_fsct_act,
  SUM(invoice_amount) AS total_invoice,
  SUM(fcst_act_amount) - SUM(invoice_amount) AS variance
FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`
GROUP BY year, team, plan_type
ORDER BY year, plan_type, total_fsct_act DESC, team;




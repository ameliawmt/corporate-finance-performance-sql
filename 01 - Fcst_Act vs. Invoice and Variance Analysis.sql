-- Forecast_Actual vs. Invoice Amounts and Variance Analysis

SELECT
  team,

CONCAT('$', FORMAT("%'d", SUM(CASE WHEN year = 2026 THEN fcst_act_amount ELSE 0 END))) AS forecast_amount,
CONCAT('$', FORMAT("%'d", SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END))) AS invoice_amount,
  
CONCAT('$', FORMAT("%'d", SUM(CASE WHEN year = 2026 THEN fcst_act_amount ELSE 0 END) - SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END))) AS variance_amount,
CONCAT(ROUND(SAFE_DIVIDE(SUM(CASE WHEN year = 2026 THEN fcst_act_amount ELSE 0 END) - SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END), SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END)) * 100, 2), '%') AS variance_pct
-- (Variance Calculation and Formatting)

FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`

GROUP BY team
ORDER BY 5 DESC; 
-- (5 is the order 'variance pct' appear)


-- YoY Growth by Team

SELECT
  team,
  
CONCAT('$', FORMAT("%'d", CAST(SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END) AS INT64))) AS `2025 Spend`,
CONCAT('$', FORMAT("%'d", CAST(SUM(CASE WHEN year = 2026 THEN fcst_act_amount ELSE 0 END) AS INT64))) AS `2026 Spend`,
CONCAT('$', FORMAT("%'d", CAST(SUM(CASE WHEN year = 2026 THEN fcst_act_amount ELSE 0 END)- SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END) AS INT64))) AS variance,
CONCAT(FORMAT('%.2f', ROUND(100 * SAFE_DIVIDE(SUM(CASE WHEN year = 2026 THEN fcst_act_amount ELSE 0 END)- SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END), SUM(CASE WHEN year = 2025 THEN fcst_act_amount ELSE 0 END)), 2)), '%') AS yoy_growth_pct

FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`

GROUP BY team
ORDER BY 5 DESC, team;
-- (5 is the order 'yoy_growth_pct' appear)
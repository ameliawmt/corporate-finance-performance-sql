-- Year-over-Year Growth by Team

WITH yearly_spend AS (
  SELECT
    year,
    team,
    SUM(fcst_act_amount) AS total_spend
  FROM `bigquery-sql-project-485901.SQL_Portfolio.budget_data_latest`
  GROUP BY year, team
)

SELECT
  team,
  MAX(CASE WHEN year = 2025 THEN total_spend END) AS spend_2025,
  MAX(CASE WHEN year = 2026 THEN total_spend END) AS spend_2026,
  ROUND(
    100 * SAFE_DIVIDE(
      MAX(CASE WHEN year = 2026 THEN total_spend END)
      - MAX(CASE WHEN year = 2025 THEN total_spend END),
      MAX(CASE WHEN year = 2025 THEN total_spend END)
    ),
    2
  ) AS yoy_growth_pct
FROM yearly_spend
GROUP BY team
ORDER BY yoy_growth_pct DESC;


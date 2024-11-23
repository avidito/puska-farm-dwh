WITH cte_dt AS (
  SELECT dt::DATE
    FROM GENERATE_SERIES(
      '2000-01-01',
      '2030-12-31',
      INTERVAL '1 DAY'
    ) AS dt
),
cte_year AS (
  SELECT DISTINCT
    NULL::DATE AS tanggal,
    DATE_PART('year', dt)::INT AS tahun,
    NULL::INT AS bulan,
    NULL::INT AS hari
  FROM cte_dt
),
cte_month AS (
  SELECT DISTINCT
    NULL::DATE AS tanggal,
    DATE_PART('year', dt)::INT AS tahun,
    DATE_PART('month', dt)::INT AS bulan,
    NULL::INT AS hari
  FROM cte_dt
),
cte_day AS (
  SELECT
    dt AS tanggal,
    DATE_PART('year', dt)::INT AS tahun,
    DATE_PART('month', dt)::INT AS bulan,
    DATE_PART('day', dt)::INT AS hari
  FROM cte_dt
)
SELECT
  ROW_NUMBER() OVER (
    ORDER BY
      tanggal,
      COALESCE(tahun, -1),
      COALESCE(bulan, -1),
      COALESCE(hari, -1)
  ) AS id,
  tanggal,
  tahun,
  bulan,
  hari
FROM (
  SELECT * FROM cte_year
  UNION ALL
  SELECT * FROM cte_month
  UNION ALL
  SELECT * FROM cte_day
) AS ud
ORDER BY 1;
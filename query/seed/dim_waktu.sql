WITH cte_old_year AS (
  SELECT
    NULL::DATE AS tanggal,
    tahun,
    NULL::INT AS bulan,
    NULL::INT AS hari
  FROM GENERATE_SERIES(2009, 2022) AS tahun
),
cte_new AS (
  SELECT
    dt AS tanggal,
    DATE_PART('year', dt)::INT AS tahun,
    DATE_PART('month', dt)::INT AS bulan,
    DATE_PART('day', dt)::INT AS hari
  FROM (
    SELECT dt::DATE
    FROM GENERATE_SERIES(
      '2023-01-01',
      '2027-12-31',
      INTERVAL '1 DAY'
    ) AS dt
  ) AS gen_dt
)
SELECT
  ROW_NUMBER() OVER (ORDER BY tanggal) AS id,
  tanggal,
  tahun,
  bulan,
  hari
FROM (
  SELECT * FROM cte_old_year
  UNION ALL
  SELECT * FROM cte_new
) AS ud
ORDER BY 1;

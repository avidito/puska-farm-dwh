UPDATE dim_lokasi T
SET
  region = S.region
FROM (
  WITH cte_provinsi AS (
    SELECT
      l.id,
      l.provinsi,
      l.kabupaten_kota,
      l.kecamatan,
      r.geom AS region
    FROM dim_lokasi AS l
    LEFT JOIN data_provinsi_geom AS r
      ON l.provinsi = UPPER(r.provinsi)
    WHERE TRUE
      AND l.kabupaten_kota IS NULL
      AND l.kecamatan IS NULL
  ),
  cte_kabupaten_kota AS (
    SELECT
      l.id,
      l.provinsi,
      l.kabupaten_kota,
      l.kecamatan,
      r.geom AS region
    FROM dim_lokasi AS l
    LEFT JOIN data_kabupaten_geom AS r
      ON l.provinsi = UPPER(r.provinsi)
      AND l.kabupaten_kota = REPLACE(UPPER(r.kabupaten), 'ADMINISTRASI ', '')
    WHERE TRUE
      AND l.kabupaten_kota IS NOT NULL
      AND l.kecamatan  IS NULL
  ),
  cte_kecamatan AS (
    SELECT
      l.id,
      l.provinsi,
      l.kabupaten_kota,
      l.kecamatan,
      r.geom AS region
    FROM dim_lokasi AS l
    LEFT JOIN (
      SELECT *
      FROM (
        SELECT *,
          ROW_NUMBER() OVER(
            PARTITION BY
              UPPER(provinsi),
              UPPER(kabupaten),
              UPPER(kecamatan)
          ) AS rn
        FROM data_kecamatan_geom
      ) AS r_rn
      WHERE rn = 1
    ) AS r
      ON l.provinsi = UPPER(r.provinsi)
      AND l.kabupaten_kota = REPLACE(UPPER(r.kabupaten), 'ADMINISTRASI ', '')
      AND l.kecamatan = UPPER(r.kecamatan)
    WHERE TRUE
      AND l.kecamatan  IS NOT NULL
  ),
  cte_union AS (
    SELECT * FROM cte_provinsi
    UNION ALL
    SELECT * FROM cte_kabupaten_kota
    UNION ALL
    SELECT * FROM cte_kecamatan
  )
  SELECT
    id,
    region
  FROM cte_union ORDER BY id
) AS S
WHERE T.id = S.id;

DROP TABLE IF EXISTS data_provinsi_geom;
DROP TABLE IF EXISTS data_kabupaten_geom;
DROP TABLE IF EXISTS data_kecamatan_geom;